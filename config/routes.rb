Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: "flats#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Adding an 'about' controller method
  resources :flats do
    resources :reviews, only: %i[new create]
    resources :bookings, only: %i[create edit update]
  end
  resources :bookings, only: [:destroy]
  resources :reviews, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
end
