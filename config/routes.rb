Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }

    resource :user, only: [:show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end


#The controllers: { sessions: :sessions } part tells the 
#router to use our custom SessionsController, 
#and path_names: { sign_in: :login } replaces sign_in in our URL for our authentication endpoint with login.