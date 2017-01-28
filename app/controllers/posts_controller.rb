class PostsController < ApplicationController
  include ApplicationHelper
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_post, only: [:edit, :update, :destroy]
  before_action :set_categories, only: [:index]

  # GET /posts
  # GET /posts.json
  # def index
  #   if params[:met] == 'true'
  #     @posts = Post.where(status: Post.statuses[:met]).paginate(page: params[:page])
  #   else
  #     @posts = Post.where(status: Post.statuses[:active]).paginate(page: params[:page])
  #   end
  # end
  
def index
  @posts = params[:search].present? ? Post.search_for(params[:search]) : Post.where(nil) 
  @posts = params[:status] == 'met' ? @posts.status(2) : @posts.status(1)
  @posts = @posts.category(params[:category].split("")) if params[:category].present?
  @posts = @posts.paginate(:page => params[:page], :per_page => 10)
end

  # GET /posts/1
  # GET /posts/1.json
  def show
    redirect_to root_url and return unless @post.status == "active" || @post.status == "met"
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { 
          @post.send_activation_email
          flash[:success] = "Please check your email to activate your post."
          redirect_to root_url 
        }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { flash[:success] = "Post was successfully updated!"; redirect_to @post }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { flash[:success] = "Post was successfully destroyed!"; redirect_to posts_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    
    # Confirms a logged-in post.
    def logged_in_post
      unless logged_in? && current_post?(@post)
        flash[:danger] = "You do not have permission for this action."
        redirect_to root_url
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :name, :email, :phone, :street_address, :zip, :description, :description_met, :picture, :facilitated_by_church, :category, :show_phone, :status, :anon_email)
    end
    
    def set_categories
      if params[:category].present?
        @rp = (params[:category].include? '0') ? true : false
        @rh = (params[:category].include? '1') ? true : false
        @op = (params[:category].include? '2') ? true : false
        @oh = (params[:category].include? '3') ? true : false
      else
        redirect_to posts_url('category' => '0123', 'search' => params[:search])
      end
    end
end
