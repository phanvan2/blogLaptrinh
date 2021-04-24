Rails.application.routes.draw do
  resources :users
  root 'articles#index'
  get 'articles/index'
  get 'register', to: 'users#new'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
