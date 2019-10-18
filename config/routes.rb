Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts
    # , only: [:index, :show, :new, :edit]
  end
  resources :posts

  get '/signup' => 'users#new', as: "signup"

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'



  get '/logout' => 'sessions#destroy'

  root 'application#index'
end
