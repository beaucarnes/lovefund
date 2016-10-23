module PostsHelper
    
  def image_for(post, cls)
    if post.picture.blank?
      return
    else
      image_tag post.picture, :class => cls
    end
  end
    
end
