class Item < ApplicationRecord
  belongs_to :user
  
  validates :japanese, presence: true, length: { maximum: 255 }
  validates :english, presence: true, length: { maximum: 255 }
end
