class GroupController < ApplicationController
    before_action :require_login

    def index
        @groups = current_user.groups
    end

    def show
        @group = cuurent_user.groups.find(params[:id])
        @total_amount = @group.items.sum(:amount)
    end

    def new
        @group = current_user.groups.new
    end

    def create
        @group = current_user.groups.new(group_params)
        if @group.save
            redirect_to groups_path, notice: "Group created successfully"
        else
            render :new
        end
    end

    private

    def group_params
        params.require(:group).permit(:name, :icon)
    end

end
