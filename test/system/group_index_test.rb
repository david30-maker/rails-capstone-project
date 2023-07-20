require 'test_helper'
require 'factory_bot'

class CategoriesIntegrationTest < ActionDispatch::IntegrationTest
  include FactoryBot::Syntax::Methods

  def setup
    @group = create(:group)
  end

  test 'displays categories correctly' do
    visit groups_path

    assert_response :success
    assert_select 'h1.group_title', text: 'Categories'

    @groups.each do |group|
      assert_select ".group_item[data-group-id='#{group.id}']" do
        assert_select 'p', text: group.icon.to_s
        assert_select 'h2.group_link', text: group.name.to_s
        assert_select 'p.group_amount', text: "$#{group.group_item}"
      end

      assert_select 'p.group_date', text: group.created_at.strftime('%B %d, %Y')
    end

    assert_select 'a.add_link', text: 'Add New Group'
  end
end
