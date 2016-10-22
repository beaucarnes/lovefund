# Preview all emails at http://localhost:3000/rails/mailers/post_mailer
class PostMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/post_mailer/post_activation
  def post_activation
    post = Post.first
    post.activation_token = Post.new_token
    PostMailer.post_activation(post)
  end

end
