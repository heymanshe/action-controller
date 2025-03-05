Rails.application.routes.draw do
  resources :photos
  get "baskets/show"
  get "baskets/update"
  get "baskets/destroy"
  get "products/index"
  get "products/show"
  get "brands/index"
  get "brands/show"
  #  get "/users/:id", to: "users#show"

  get "/users/:id", to: "users#show", as: "user"
  get "clients/new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # resources :clients do
  #   member do
  #     get "download_pdf"
  #   end
  # end
  resources :clients, only: [ :index, :show ]

  resources :lyrics, only: [ :show ]
  root "admins#index"
  resources :admins, only: [ :index ]
  resources :users, only: [ :index, :create ]

  resources :posts, only: [ :index ]
  # Defines the root path route ("/")
  # root "posts#index"


  resources :brands, only: [ :index, :show ] do
    resources :products, only: [ :index, :show ]
  end

  resource :basket, only: [ :show, :update, :destroy ]

  resolve("Basket") { route_for(:basket) }
end
