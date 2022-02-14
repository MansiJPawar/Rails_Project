class RegistrationsController < Devise::RegistrationsController
   #extended params to devise form
   def sign_up_params
     params.require(:user).permit(:email,:password,:password_confirmation,:current_password,:country,:state,:city,:phone_number, :gender)
   end
end
