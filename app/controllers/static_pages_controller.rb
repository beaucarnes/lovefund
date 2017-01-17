class StaticPagesController < ApplicationController
  def home
    @posts_rp = Post.where(category: Post.categories[:request_prayer]).take(4)
    @posts_rh = Post.where(category: Post.categories[:request_help]).take(4)
    @posts_op = Post.where(category: Post.categories[:offer_prayer]).take(4)
    @posts_oh = Post.where(category: Post.categories[:offer_help]).take(4)
  end

  def help
  end
  
  def about
  end
  
  def contact
  end
end
