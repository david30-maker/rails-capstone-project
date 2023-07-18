class SessionsController < Devise::SessionsController
  before_action :set_current_user

  def destroy
    sign_out(current_user)
    redirect_to root_path, notice: 'You have been signed out successfully.'
  end

  # def set_current_user
  #   @current_user = current_user
  # end
end
