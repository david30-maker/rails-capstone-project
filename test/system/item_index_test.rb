require 'application_system_test_case'

class ItemsIndexTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    @groups = groups.select { |group| group.user_id == @user.id }
    @items = items.select { |item| item.author_id == @user.id }
    @groups.first.items << @items.first
    @groups.second.items << @items.second
  end

  test 'displays all items for a signed in user correctly' do
    sign_in(@user)
    visit item_index_path

    @items.each do |item|
      assert_text item.name
      assert_text "$#{item.amount.to_f}"
      assert_text item.created_at.strftime('%e %B %Y')
    end
  end
end
