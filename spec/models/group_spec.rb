require 'rails_helper'

# spec/models/group_spec.rb
require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { create(:user) }

  describe "associations" do
    it { should belong_to(:user).class_name('User').with_foreign_key(:user_id) }
    it { should have_many(:group_items).dependent(:destroy) }
    it { should have_many(:items).through(:group_items).dependent(:destroy) }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:icon) }
  end

  describe "when creating a group" do
    it "is valid with valid attributes" do
      group = Group.new(name: "Example Group", icon: "group_icon", user: user)
      expect(group).to be_valid
    end

    it "is not valid without a name" do
      group = Group.new(icon: "group_icon", user: user)
      expect(group).not_to be_valid
    end

    it "is not valid without an icon" do
      group = Group.new(name: "Example Group", user: user)
      expect(group).not_to be_valid
    end

    # Additional tests...
  end
end
