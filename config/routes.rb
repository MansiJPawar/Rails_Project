Rails.application.routes.draw do
  get 'offers/index'
  get 'businesses/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "skydash#dashboard"
  
  resources :businesses do
    resources :offers
  end 
  
end