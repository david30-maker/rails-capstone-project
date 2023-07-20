require 'rails_helper'

RSpec.describe ItemController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }
  let(:item_params) { { name: 'New Item', amount: 100, group_id: group.id } }

  before do
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe "GET #index" do
    it "assigns @items in descending order" do
      item1 = FactoryBot.create(:item, user: user, created_at: 1.day.ago)
      item2 = FactoryBot.create(:item, user: user, created_at: Time.current)

      get :index
      expect(assigns(:items)).to eq([item2, item1])
    end
  end

  describe "GET #show" do
    it "assigns @item, @group_items, and @groups" do
      item = FactoryBot.create(:item, user: user)
      item.groups << group

      get :show, params: { id: item.id }
      expect(assigns(:item)).to eq(item)
      expect(assigns(:group_items)).to eq([group])
      expect(assigns(:groups)).to eq([])
    end
  end

  describe "GET #new" do
    it "assigns @item and @groups" do
      get :new
      expect(assigns(:item)).to be_a_new(Item)
      expect(assigns(:groups)).to eq([group])
    end
  end

  describe "POST #create" do
    it "creates a new item and associates it with the selected group" do
      expect {
        post :create, params: { item: item_params }
      }.to change(Item, :count).by(1)

      item = Item.last
      expect(item.groups).to eq([group])
      expect(response).to redirect_to(item_path(item))
    end

    it "renders the new template with an error when invalid parameters are provided" do
      expect {
        post :create, params: { item: { name: '', amount: 100, group_id: group.id } }
      }.not_to change(Item, :count)

      expect(response).to render_template(:new)
    end
  end

  describe "POST #add_group" do
    it "adds a new group to the item and redirects to the item show page" do
      item = FactoryBot.create(:item, user: user)
      expect {
        post :add_group, params: { id: item.id, format: group.id }
      }.to change(item.groups, :count).by(1)

      expect(response).to redirect_to(item_path(item))
    end
  end
end
