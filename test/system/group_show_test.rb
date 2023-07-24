require 'application_system_test_case'

class CategoriesIntegrationTest < ApplicationSystemTestCase
  def setup
    @user = users(:one)
    @groups = groups.select { |group| group.user_id == @user.id }
    # @item = create(:item, name: 'Item 1', amount: 50)
    # @item = create(:item, name: 'Item 2', amount: 75)

    # @total = @group.items.sum(:amount)
  end

  test 'displays group show page correctly' do
    # assert_text @group.name, wait: 5
    assert_text "$#{@total}"
  end
end

#     visit group_path(@group)

#     assert_response :success
#     assert_select 'div.group_container_show'

#     assert_select 'div.title_show' do
#       assert_select 'h1', text: @group.name
#       assert_select 'p', text: "$#{@total}"
#     end

#     @group.items.each do |item|
#       assert_select 'div.name_amount' do
#         assert_select 'h3', text: item.name
#         assert_select 'p', text: "$#{item.amount}"
#       end

#       assert_select 'p.show_date', text: item.created_at.strftime('%A, %B %d, %Y')
#     end

#     assert_select 'a.view_link', text: 'View Items'
#     assert_select 'a.back_link', text: 'Back to Groups'
#   end
# end
