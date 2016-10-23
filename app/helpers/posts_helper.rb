module PostsHelper
    
  def image_for(post, cls)
    if post.picture.blank?
      image_tag 'placeholder.png', :class => cls
    else
      image_tag post.picture, :class => cls
    end
  end
    
end
