Rails.application.routes.draw do
  get 'menu_items/new'
  get 'menu_items/create'
  get 'menu_items/edit'
  get 'menu_items/update'
  get 'menu_items/destroy'
  get 'menus/index'
  get 'menus/new'
  get 'menus/create'
  get 'menus/edit'
  get 'menus/update'
  get 'menus/destroy'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  delete '/logout', to: 'sessions#destroy', as: :logout

  namespace :admin do
    resources :articles
    resources :testimonials
    resources :pages
    resources :media
    resources :posts
    resources :comments
    resources :users
    resources :settings
    resources :services do
      member do
        patch :featured_image
      end
    end
    resources :menus do
      resources :menu_items do
        patch :update_position, on: :member
      end
    end
    root to: 'dashboard#index'
  end

    get 'footer', to: 'menus#footer'
  # Defines the root path route ("/")
   root "home#index"
end
