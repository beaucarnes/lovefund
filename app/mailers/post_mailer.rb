class PostMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.post_mailer.post_activation.subject
  #
  def post_activation(post)
    @post = post
    mail to: post.email, subject: "Post activation"
  end
end
