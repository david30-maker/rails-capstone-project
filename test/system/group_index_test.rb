require "application_system_test_case"

class CategoriesIntegrationTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:one)
    @groups = groups.select { |group| group.user_id == @user.id }
  end

  test 'user can sign in and access the groups index page' do
    sign_in(@user)
    visit group_index_path
    assert_text "Categories"
    assert_selector "h1.group_title", wait: 5

    @groups.each do |group|
      assert_text group.name
      assert_text group.icon
      assert_text "$#{group.items.sum(:amount).to_f}"
      assert_selector "a", text:"Add New Category"
    end
  end
end

