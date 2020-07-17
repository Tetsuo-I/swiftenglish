class Item < ApplicationRecord
  belongs_to :user

  validates :japanese, presence: true, length: { maximum: 255 }
  validates :english, presence: true, length: { maximum: 255 }
  
  has_many :likes, foreign_key: 'item_id', dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  
end
