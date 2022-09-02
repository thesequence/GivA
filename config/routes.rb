Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"


  resources :buddies, only: %i[index show] do
    resources :messages, only: :create
    resources :reviews, only: %i[new create]
  end

  resources :profiles, only: %i[show index] do
    resources :buddies, only: %i[new create]
  end

  resources :locations, only: %i[index show]

  # resources :users, only: :show do
  # resources :reviews, only: [:new, :create]
  # end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
