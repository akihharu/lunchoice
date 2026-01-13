class Post < ApplicationRecord
  has_one_attached :photo do |attachable|
    attachable.variant :thumb, resize_to_fill: [300, 300], format: :webp
    attachable.variant :medium, resize_to_limit: [800, 800], format: :webp
  end
  
  belongs_to :user
  belongs_to :dish
  
  validates :photo, presence: true

  validates :user_id, presence: true
  validates :dish_id, presence: true
end
