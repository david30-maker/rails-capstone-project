# spec/factories/groups.rb
FactoryBot.define do
  factory :group do
    sequence(:name) { |n| "Group #{n}" }
    icon { 'icon.png' }
    association :user, factory: :user
  end
end

  