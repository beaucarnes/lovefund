class Post < ActiveRecord::Base
    validates :title,  presence: true, length: { maximum: 200 }
    validates :name,  presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
    validates :description, presence: true

    enum category: [ :request_prayer, :request_help, :offer_prayer, :offer_help ]
    validates :category, inclusion: { in: Post.categories.keys }
    enum status: [ :pending, :active, :met, :expired ]
    validates :status, inclusion: { in: Post.statuses.keys }

    def get_category
        cat = category.dup
        cat.gsub!('_',' ')
    end
    
end
