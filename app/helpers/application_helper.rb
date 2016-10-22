module ApplicationHelper
    
    # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Lovefund"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  # Logs in to allow editing of a post.
  def log_in(post)
    session[:post_id] = post.id
  end

  # Returns true if the given post is the current post.
  def current_post?(post)
    post == current_post
  end
  
  # Returns the current logged-in post (if any).
  def current_post
    @current_post ||= Post.find_by(id: session[:post_id])
  end
  
  # Returns true if logged in to edit post, false otherwise.
  def logged_in?
    !current_post.nil?
  end
end
