class Claim < ActiveRecord::Base
  belongs_to :post
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  # Sends notification email.
  def send_notification_email
    ClaimMailer.claim_notification(self).deliver_now
  end
end
