Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  
  resources :achievements

  get '/posts/hashtag/:name', to:'posts#hashtags'
  
  #server side dataTable
  get 'get_dataset', to: 'sports#get_dataset'

  resources :sports do
    resources :posts do
      resources :comments
    end
  end

  resources :sports do
    resources :announcements
  end

  root to: 'pages#home'

  devise_for :users , :controllers => {registrations: 'registrations'}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
