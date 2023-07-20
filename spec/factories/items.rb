FactoryBot.define do
  factory :item do
    sequence(:name) { |n| "Item #{n}" }
    amount { 100 }
    association :user # Assuming you have a factory defined for the User model named "user"
  end
end