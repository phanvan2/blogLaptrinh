Rails.application.routes.draw do
  resources :blogs
  get 'footer/index'
  get 'menu/index'
  resources :users
  root 'articles#index'
  get 'articles/index'
  get 'register', to: 'users#new'
  get 'menu' , to: 'menu#index'
  get "user/update", to: 'users#edit'
  get 'login', to: 'users#login'
  post 'session' => 'session#create'
  get '/logout' => 'session#destroy'
  get 'user/:id/profile', to: 'users#show'
  get 'user/:id/update', to: 'users#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
