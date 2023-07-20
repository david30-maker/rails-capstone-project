# spec/models/group_item_spec.rb
require 'rails_helper'

RSpec.describe GroupItem, type: :model do
  describe "associations" do
    it { should belong_to(:group) }
    it { should belong_to(:item) }
  end
end

