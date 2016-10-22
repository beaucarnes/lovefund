class PostActiviationsController < ApplicationController
  def edit
    post = Post.find_by(id: params[:post_id])
    if post && post.authenticated?(:activation, params[:id])
      if post.pending? 
        flash[:success] = "Post activated!"
        post.activate
      end
      log_in post

      redirect_to edit_post_path(post)
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
