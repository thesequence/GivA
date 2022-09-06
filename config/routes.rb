Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "my_buddies", to: "pages#my_buddies"


  resources :buddies, only: %i[index show] do
    # resources :messages, only: %i[create]
    resources :reviews, only: %i[new create]
  end

  resources :chats, only: %i[create show] do
    resources :messages, only: %i[create]
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
