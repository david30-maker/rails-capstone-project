class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    put 'show'
    if params[:id] == 'sign_out'
      sign_out(current_user)
      redirect_to root_path, notice: 'Signed out successfully.'
    else
      redirect_to root_path
    end
  end
end
