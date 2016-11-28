module PostsHelper
  
  # Returns the Gravatar for the given email.
  def gravatar_for(claim)
    gravatar_id = Digest::MD5::hexdigest(claim.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=identicon"
    image_tag(gravatar_url, size: "50", alt: claim.name, class: "gravatar")
  end
    
  def image_for(post, cls)
    if post.picture.blank?
      return
    else
      image_tag post.picture, :class => cls
    end
  end
    
end
