class Post < ActiveRecord::Base
  attr_accessor :activation_token
  before_save   :downcase_email
  before_create :create_activation_digest
  
  validates :title,  presence: true, length: { maximum: 200 }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :description, presence: true

  enum category: [ :request_prayer, :request_help, :offer_prayer, :offer_help ]
  validates :category, inclusion: { in: Post.categories.keys }
  enum status: [ :pending, :active, :met, :expired ]
  validates :status, inclusion: { in: Post.statuses.keys }
  
 
  # Returns true if status is pending
  def pending?
    return status == "pending"
  end
  
  # Returns true if status is met or expired
  def done?
    return status == "met" || status == "expired"
  end
  
  # Activates a post.
  def activate
    update_attribute(:status, :active)
  end

  # Sends activation email.
  def send_activation_email
    PostMailer.post_activation(self).deliver_now
  end
  
  # Returns the hash digest of the given string.
  def Post.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  # Returns a random token.
  def Post.new_token
    SecureRandom.urlsafe_base64
  end

  # Returns true if the given token matches the digest.
  def authenticated?(token)
    digest = send("activation_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end
  
    # Converts email to all lower-case.
    def downcase_email
      self.email = email.downcase
    end

    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = Post.new_token
      self.activation_digest = Post.digest(activation_token)
    end
    
end
