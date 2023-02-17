Rails.application.routes.draw do
  get 'reviews/new'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Adding an 'about' controller method
  resources :flats do
    resources :reviews, only: [:new]
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
