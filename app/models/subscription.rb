class Subscription < ActiveRecord::Base
  before_save   :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validate :is_assigned
  
  
  
  
  def is_assigned
    unless wants_oh || wants_op || wants_rh || wants_oh
      errors[:base] << "You must choose at least one category!"
    end
  end  
  
  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

    
end
