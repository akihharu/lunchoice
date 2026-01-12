FactoryBot.define do
  factory :post do
    association :user
    association :dish
  end
end