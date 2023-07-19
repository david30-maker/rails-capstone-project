class GroupsController < ApplicationController
    before_action :authenticate_user!

    def index
        @user = current_user
        @groups = @user.groups.all.order(created_at: :desc)
      end

    def show
        @group = Group.includes(:items).find(params[:id])
        @group_items = @group.items
        @items = Item.where.not(id: @group.items.pluck(:id))
        @group = Group.find(params[:id])
    end

    def new
        @group = Group.new
        @group_options = Group.pluck(:name, :icon)
    end

    def create
        @group = Group.new(group_params)

        respond_to do |format|
        if @group.save
            format.html {redirect_to groups_path, notice: "Group created successfully" }
        else
            format.html { render :new, status: :unprocessable_entity, alert: "Something went wrong" }
        end
    end
    end

    def add_item
        @group = Group.find(params[:id])
        @item = Item.find(params[:format])
        @group.add_unique_item(@item)
        redirect_to group_path(@group), notice: "Item added to group"
    end

    private

    def group_params
        params.require(:group).permit(:name, :icon, :user_id)
    end

end
