Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  resources :sports do
    resources :posts
  end

  resources :sports do
    resources :announcements
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
