# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    # Use Faker to generate unique attributes for each user
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { "password" } # Replace with a valid password

    # Add any other attributes as needed for the factory
  end
end
