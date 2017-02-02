class StaticPagesController < ApplicationController
  def home
    @posts_rp = Post.where(category: Post.categories[:request_prayer], status: Post.statuses[:active]).take(4)
    @posts_rh = Post.where(category: Post.categories[:request_help], status: Post.statuses[:active]).take(4)
    @posts_op = Post.where(category: Post.categories[:offer_prayer], status: Post.statuses[:active]).take(4)
    @posts_oh = Post.where(category: Post.categories[:offer_help], status: Post.statuses[:active]).take(4)
    @posts_met = Post.where(status: Post.statuses[:met]).take(2)
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
