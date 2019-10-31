Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sessions, only: [:new, :create, :destroy]
  resources :users  do
    resources :posts

  end
  resources :posts


  get '/signup' => 'users#new', as: "signup"

  get '/login' => 'sessions#new', as: "login"
  post '/login' => 'sessions#create'

  get 'logout', to: 'sessions#destroy', as: 'logout'


  get '/search' => 'posts#search', :as => 'search_post'

  root 'application#index'

end
