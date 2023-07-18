class ItemController < ApplicationController
before_action :authenticate_user!

def index 
    @group = current_user.groups.find(params[:group_id])
    @items = @group.items.order(created_at: :desc)
    @total_amount = @group.items.sum(:amount)
    # @items = @group.items
end

def show
    @group = current_user.groups.find(params[:group_id])
    @item = @group.items.find(params[:id])
end

def new
    @group = current_user.groups.find(params[:group_id])
    @item = @group.items.new
end

def create
    @group = current_user.groups.find(params[:group_id])
    @item = @group.items.new(item_params)
    if @item.save
        redirect_to group_item_path(@group), notice: 'Item was successfully created.'
    else
        render :new
    end
end

private

def item_params
    params.require(:item).permit(:name, :amount, :author_id)
end

end
