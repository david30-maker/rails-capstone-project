class PasswordsController < Devise::PasswordsController
    # GET /resource/password/new
    def new
      super
    end
  
    # POST /resource/password
    def create
      super
    end
  
    # GET /resource/password/edit?reset_password_token=abcdef
    def edit
      super
    end
  
    # PUT /resource/password
    def update
      super
    end
  
    protected
  
    # The path used after sending reset password instructions
    def after_sending_reset_password_instructions_path_for(resource_name)
      super(resource_name)
    end
  
    # The path used after resetting the password
    def after_resetting_password_path_for(resource)
      super(resource)
    end

    def set_current_user
        @current_user = current_user
        end
  end
  