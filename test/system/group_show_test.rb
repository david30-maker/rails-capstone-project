require 'application_system_test_case'


class GroupShowTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers
  def setup
    @user = users(:one)
    @groups = groups.select { |group| group.user_id == @user.id }
    @group = @groups.first
    @items = items.select { |item| item.author_id == @user.id }
    @group.items << @items
  end

  test 'displays group show page correctly' do
    sign_in(@user)
    visit group_path(@group)
    assert_text @group.name
    @group.items.each do |item|
      assert_text item.name
      assert_text "$#{item.amount.to_f}"
      assert_text item.created_at.strftime('%A, %B %d, %Y')
    end
  end
end
