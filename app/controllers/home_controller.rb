class HomeController < ApplicationController
  def splash
    if current_user
      redirect_to group_index_path
    else
      render :splash
    end
  end
end
