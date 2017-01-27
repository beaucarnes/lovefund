class Subscription < ActiveRecord::Base
  before_save   :downcase_email
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validate :is_assigned
  
  
  
  
  def is_assigned
    unless wants_rp || wants_op || wants_rh || wants_oh
      errors[:base] << "You must choose at least one category!"
    end
  end  
  
  # Converts email to all lower-case.
  def downcase_email
    self.email = email.downcase
  end

  # Sends activation email.
  def send_notification_email(post)
    SubscriptionMailer.notification_message(self, post).deliver_now
  end
  
  # Check if post matches any subscriptions 
  def Subscription.check_subscriptions(post)
    
    Subscription.find_each do |subscription|
      puts "checking" + subscription.email.to_str
      if (
        ((post.category == "request_prayer" && subscription.wants_rp) ||
        (post.category == "request_help" && subscription.wants_rh) ||
        (post.category == "offer_prayer" && subscription.wants_op) ||
        (post.category == "offer_help" && subscription.wants_oh)) &&
        (!subscription.term || post.title.downcase.include?(subscription.term.downcase) || post.description.downcase.include?(subscription.term.downcase))
        )
          puts "found " + subscription.email.to_str
        #  subscription.send_notification_email(post)
      end
    end
  end
    
end
