# Preview all emails at http://localhost:3000/rails/mailers/claim_mailer
class ClaimMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/claim_mailer/claim_notification
  def claim_notification
    ClaimMailer.claim_notification
  end

end
