class RegistrationsController < DeviseTokenAuth::RegistrationsController 
  
  #GET /resource/sign_up
  def create
    user = User.new(sign_up_params)
    if user.save 
      render_success 200, true, 'User created successfully', user.as_json
    else
      render_success 500, false, 'Enter valid inputs'
    end
  end

  def show
    render json: User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: {}, status: :not_found
    #return_error 500, false, errors, {}
  end

  private

  def sign_up_params
    params.require(:user).permit(:email,:password,:password_confirmation,:uid,:provider,:name)
  end
end
