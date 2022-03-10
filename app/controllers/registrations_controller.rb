class RegistrationsController < DeviseTokenAuth::RegistrationsController 
   
  #POST   /auth
  def create
    user = User.new(sign_up_params)
    if user.save 
      render_success 200, true, 'User created successfully', user.as_json
    else
      render_success 500, false, 'Enter valid inputs'
    end
  end

  private
    #sign up attributes
    def sign_up_params
      params.require(:user).permit(:email,:password,:password_confirmation,:uid,:provider,:name)
    end
end
