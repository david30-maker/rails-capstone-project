class ConfirmationsController < Devise::ConfirmationsController
    # GET /resource/confirmation/new
    def new
      super
    end
  
    # POST /resource/confirmation
    def create
      super
    end
  
    # GET /resource/confirmation?confirmation_token=abcdef
    def show
      super
    end


    def set_current_user
        @current_user = current_user
        end
  end
  