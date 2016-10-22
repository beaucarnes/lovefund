module PostsHelper
    
  def image_for(post)
    if post.picture.blank?
      image_tag 'placeholder.png'
    else
      image_tag post.picture
    end
  end
    
end
