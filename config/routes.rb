Rails.application.routes.draw do
  get 'offers/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "skydash#dashboard"
  
  # Business Routes
  resources :businesses 
  get 'fetch_businesses', to: 'businesses#fetch_businesses'
 
  # Offers Routes
  resources :offers
  get '/fetch_offers', to: 'offers#fetch_offers'
end