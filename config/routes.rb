Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'registrations', sessions: 'sessions'
  }

  concern :api_base do
    devise_scope :user do
      resources :sports do
        resources :posts
        resources :announcements
      end
        resources :achievements
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      concerns :api_base
    end

    namespace :v2 do
      concerns :api_base
    end
  end  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
