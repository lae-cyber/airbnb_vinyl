Rails.application.routes.draw do
  get 'rental_calculator/calculate_total_price'
  get 'vinyl_bookings/calculate_total_price'
  devise_for :users

  root 'static_pages#home'
  get '/vinyls/mine', to: 'vinyls#mine', as: 'my_vinyls'
  resources :vinyls do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:edit, :update, :destroy]

  # Vinyl routes
  #get '/vinyls', to: 'vinyls#index'
  #get '/vinyls/new', to: 'vinyls#new'
  #get '/vinyls/mine', to: 'vinyls#mine', as: 'my_vinyls'
  #get '/vinyls/:id', to: 'vinyls#show', as: 'vinyl'
  #post '/vinyls/:id/bookings', to: 'bookings#create', as: 'vinyl_bookings'
  #delete '/vinyls/:id', to: 'vinyls#destroy'
  #get '/vinyls/:id/edit', to: 'vinyls#edit', as: 'edit_vinyl'
  #patch '/vinyls/:id', to: 'vinyls#update'
  #post '/vinyls', to: 'vinyls#create'
  # New booking route
  # get '/vinyls/:id/bookings/new', to: 'bookings#new', as: 'new_vinyl_booking'

  # Reviews routes
  post '/reviews', to: 'reviews#create', as: 'reviews'
  delete '/reviews/:id', to: 'reviews#destroy'


  # Health check route
  get "up" => "rails/health#show", as: :rails_health_check
end
