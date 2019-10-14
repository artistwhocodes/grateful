Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :posts, only: [:index, :show, :new, :edit]
  end
  resources :posts
end
