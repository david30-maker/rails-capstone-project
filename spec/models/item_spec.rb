# spec/models/item_spec.rb
require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user) { create(:user) }

  describe "associations" do
    it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    it { should have_many(:group_items) }
    it { should have_many(:groups).through(:group_items) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:amount) }
  end

  describe "when creating an item" do
    it "is valid with valid attributes" do
      item = Item.new(name: "Example Item", amount: 100, author: user)
      expect(item).to be_valid
    end

    it "is not valid without a name" do
      item = Item.new(amount: 100, author: user)
      expect(item).not_to be_valid
    end

    it "is not valid without an amount" do
      item = Item.new(name: "Example Item", author: user)
      expect(item).not_to be_valid
    end

    # Additional tests...
  end
end
