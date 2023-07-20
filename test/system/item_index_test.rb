require 'test_helper'

class ItemIndexIntegrationTest < ActionDispatch::IntegrationTest
  def setup
    @items = create_list(:item, 5)
  end

  test 'displays item index page correctly' do
    visit items_path

    assert_response :success
    assert_select 'div.item_container'

    @items.each do |item|
      assert_select 'div.item_index' do
        assert_select 'h1', text: item.name
        assert_select 'p', text: "$#{item.amount}"
      end

      assert_select 'p.item_date', text: item.created_at.strftime('%e %B %Y')
    end

    assert_select 'a.new_item_link', text: 'New Item'
    assert_select 'a.back_link', text: 'Back to group'
  end
end
