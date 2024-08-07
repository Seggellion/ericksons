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
  resources :services, only: [:index, :show]
  resources :contact_messages, only: [:new, :create]
  resources :events, only: [:index, :show], param: :slug
  resources :products, only: [:index, :show], param: :handle do
    post 'add_to_cart', on: :member
  end

  get '/cart', to: 'products#cart', as: :cart
  get 'checkout', to: 'products#checkout'
  delete 'cart/remove/:line_id', to: 'products#remove_from_cart', as: 'remove_from_cart'


  namespace :admin do
    resources :articles
    resources :testimonials
    resources :pages do
      member do
        patch :update_category
      end
    end
    resources :media, only: [:index, :destroy]
    resources :posts
    resources :comments
    resources :users
    resources :categories
    resources :events
    resources :settings
    resources :services do
      member do
        patch :update_category
        patch :featured_image
      end
    end
    resources :contact_messages, only: [:index, :show]
    resources :menus do
      resources :menu_items do
        patch :move_up, on: :member
        patch :move_down, on: :member
        patch :update_parent
      end
    end
    
    resources :sections do
      member do
        patch :move_up
        patch :move_down
      end
      resources :blocks, only: [:new, :create, :edit, :update, :destroy] do
        member do
          patch :move_up
          patch :move_down
        end
      end
    end

    root to: 'dashboard#index'
  end

    # Catch-all route for pages based on slug, excluding specific paths
    get '/:slug', to: 'pages#show', constraints: lambda { |req|
      !req.path.starts_with?('/services', '/admin', '/pages')
    }, as: :catch_all_page
  

    get 'pages', to: 'pages#index'
    get 'footer', to: 'menus#footer'
  # Defines the root path route ("/")
   root "home#index"
end
