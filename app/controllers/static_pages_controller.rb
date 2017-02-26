class StaticPagesController < ApplicationController
  def home
    @posts = Post.where(status: Post.statuses[:active]).take(6)
    @posts_met = Post.where(status: Post.statuses[:met]).take(4)
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
