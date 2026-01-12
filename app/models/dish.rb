class Dish < ApplicationRecord
  has_many :choices
  has_many :posts, dependent: :destroy
end
