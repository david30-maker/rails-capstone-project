# factories/item.rb
FactoryBot.define do
  factory :item do
    name { "Default Item" }
    amount { 0 }
  end
end
