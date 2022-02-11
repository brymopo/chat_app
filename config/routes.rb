Rails.application.routes.draw do
  devise_for :users
  root "rooms#index"
  resources :rooms, except: %i[destroy] do
    resources :messages, except: %i[destroy]
  end
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
