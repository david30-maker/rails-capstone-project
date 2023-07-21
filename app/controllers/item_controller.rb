class ItemController < ApplicationController
  before_action :authenticate_user!
  def index
    @user = current_user
    @items = @user.items.all.order(created_at: :desc)
  end

  def show
    @item = Item.find_by(id: params[:id])
    if @item.nil?
      redirect_to root_path, alert: "Item not found."
    else
    @group_items = @item.groups
    @groups = Group.where.not(id: @item.groups.pluck(:id))
  end
  end

  def new
    @item = Item.new
    @groups = current_user.groups
  end

  def create
    @group = Group.find(group_params[:group_id])
    @item = current_user.items.new(item_params)
    respond_to do |format|
      if @item.save
        @item.add_unique_group(@group)
        format.html { redirect_to group_index_path, notice: 'Item was successfully created.' }
      else
        format.html { render :new, staus: :unprocessable_entity, alert: 'Something went wrong' }
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :amount, :icon, :author_id, :group_id)
  end

  def group_params
    params.permit(:group_id)
  end
end
