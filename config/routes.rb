Rails.application.routes.draw do
  devise_for :users
  resources :profiles, only: %i[show index]
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :chats, only: :show do
    resources :messages, only: :create
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
