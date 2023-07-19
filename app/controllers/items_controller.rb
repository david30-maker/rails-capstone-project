class ItemsController < ApplicationController
before_action :authenticate_user!

def index 
   @user = current_user
    @items = @user.items.all.order(created_at: :desc)
    @group = Group.find(params[:group_id])
    @items = @group.items
end

def show
    @item = Item.find(params[:group_id])
    @group_items = @item.groups
    @groups = Group.where.not(id: @item.groups.pluck(:id))
end

def new
    @group = Group.find(params[:group_id])
    @item = @group.items.new
end

def create
    @group = Group.find(params[:group_id])
    @item = @group.items.new(item_params)

    respond_to do |format|
    if @item.save
       format.html { redirect_to item_path(@item), notice: 'Item was successfully created.'}
    else
       format.html { render :new, staus: :unprocessable_entity, alert: 'Something went wrong' }
    end
end
end

def add_group
    @item = Item.find(params[:id])
    @group = Group.find(params[:format])
    @item.add_unique_group(@group)
    redirect_to item_path(@item)
end

private

def item_params
    params.require(:item).permit(:name, :amount, :author_id)
end

end
