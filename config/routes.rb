Rails.application.routes.draw do
  root "rooms#index"
  resources :rooms, except: %i[destroy] do
    resources :messages, except: %i[destroy]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
