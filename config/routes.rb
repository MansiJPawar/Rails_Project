Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #http://localhost:3000/api/v1/ 
   # API routes path
   # API routes path

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      #devise_for :users
      resources :users, :only => [:show, :create, :update, :destroy]
    end
  end   
end


