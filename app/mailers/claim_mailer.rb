class ClaimMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.claim_mailer.claim_notification.subject
  #
  def claim_notification(claim)
    @post = Post.find(claim.post_id)
    @claim = claim

    mail to: @post.email, subject: "New claim for your post!"
  end

end
