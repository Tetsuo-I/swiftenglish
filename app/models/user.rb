class User < ApplicationRecord
    before_save { self.email.downcase! }
      validates :name, presence: true, length: { maximum: 50 }
      validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :items
    has_many :likes, dependent: :destroy
    has_many :like_items, through: :likes, source: :item
   
    def like(item)
      self.likes.find_or_create_by(item_id: item.id)
    end
  
    def unlike(item)
      self.likes.find_by(item_id: item.id).destroy
    end
  
    def like?(item)
      self.like_items.include?(item)
    end

end
