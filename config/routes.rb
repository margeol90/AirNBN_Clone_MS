Rails.application.routes.draw do
  get 'bookings/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Adding an 'about' controller method
  resources :flats do
    resources :bookings, only: %i[create edit update]
  end
  resources :bookings, only: [:destroy] do
    resources :reviews, only: %i[new create]
  end
  resources :reviews, only: [:destroy]
  # Defines the root path route ("/")
  # root "articles#index"
  get    "pages/my_flats", to: "pages#my_flats", as: :my_flats
  get    "pages/my_bookings", to: "pages#my_bookings", as: :my_bookings
end
