class UsersController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        @expenses = @user.expenses
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        user = User.find(params[:id])

        if user.update(user_params)
            redirect_to user_path(user)
        else
            render :edit
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy

        redirect_to users_path
    end
end
