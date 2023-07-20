# spec/factories/users.rb
FactoryBot.define do
    factory :user do
      name { Faker::Internet.unique.username }
      email { Faker::Internet.unique.email }
      password { 'password' }
      # Any other attributes you need for the User model
    end
  end
  