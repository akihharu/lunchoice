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

  scope :by_query, ->(query) {joins(:dish).where("dishes.name LIKE ?", "%#{query}%") if query.present?}
  scope :by_dish, ->(dish_id) {where(dish_id: dish_id) if dish_id.present?}
  scope :by_cuisine, ->(cuisine) {joins(:dish).where(dishes: { cuisine: cuisine}) if cuisine.present?}

end
