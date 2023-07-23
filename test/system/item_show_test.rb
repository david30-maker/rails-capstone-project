# require 'test_helper'
# require 'factory_bot'

# class GroupItemsIntegrationTest < ActionDispatch::IntegrationTest
#   # include FactoryBot::Syntax::Methods
#   def setup
#     # @group_items = create_list(:group_item, 5)
#     @group_items = groups
#   end

#   test 'displays group items table correctly' do
#     visit group_items_path

#     assert_response :success
#     assert_select 'table.table.mx-auto.p-lg-5.table-striped.bg-light.p-2.table-hover'

#     @group_items.each_with_index do |item, index|
#       assert_select 'tbody tr' do
#         assert_select 'th', text: (index + 1).to_s
#         assert_select 'td', text: item.name
#         assert_select 'td', text: item.group_item.to_s
#         assert_select 'td', text: item.created_at.strftime('%e %B %Y')
#       end
#     end
#   end
# end
