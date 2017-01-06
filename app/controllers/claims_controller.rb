class ClaimsController < ApplicationController
    
  def new
    @post = Post.find(params[:post_id])
    @claim = @post.claims.new
  end
  
  def create
    @post = Post.find(params[:post_id])
    @claim = @post.claims.new(claim_params)
    if @claim.save
      @claim.send_notification_email
      flash[:success] = "Thanks for your help!"
      redirect_to @post
    else
      render :new
    end
  end
  
  def destroy
    @post = Post.find(params[:post_id])
    @claim = Claim.find(params[:id])
    @claim.destroy
    respond_to do |format|
      format.html { flash[:success] = "Successfully deleted!"; redirect_to @post}
      format.json { head :no_content }
    end
  end
  
  private
  
  def claim_params
    params.require(:claim).permit(:name, :email, :note, :amount, :private)
  end  
  
  
end
