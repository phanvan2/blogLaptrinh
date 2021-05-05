Rails.application.routes.draw do
  resources :comments
  get 'search_blog/index'
  resources :categories
  resources :blogs
  get 'footer/index'
  get 'menu/index'
  resources :users
  root 'articles#index'
  get 'articles/index'
  get 'register', to: 'users#new'
  get 'menu' , to: 'menu#index'
  get "user/update", to: 'users#edit'
  #get 'login', to: 'users#login'
  post 'session' => 'session#create'
  get '/logout' => 'session#destroy'
  get 'user/:id/profile', to: 'users#show'
  get 'user/:id/update', to: 'users#edit'
  get '/login' => 'session#index'
  get '/search' => 'search_blog#index'
  post '/comments1/create' => 'comments#create'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
