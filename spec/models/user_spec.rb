# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe 'associations' do
    it { should have_many(:groups).class_name('Group').with_foreign_key(:user_id).dependent(:destroy) }
    it { should have_many(:items).class_name('Item').with_foreign_key('author_id').dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).is_at_most(250) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'callbacks' do
    it 'calls name_decoration before creating a user' do
      user = build(:user, name: 'John')
      expect(user).to receive(:name_decoration)
      user.save
    end
  end

  # Additional tests...
end
