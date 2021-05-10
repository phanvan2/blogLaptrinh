Rails.application.routes.draw do
  resources :reply_comments
  resources :comments
  get 'search_blog/index'
  resources :categories
  resources :blogs
  get 'footer/index'
  get 'menu/index'
  get 'admin/index'
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
  post '/reply_comments/create' => 'reply_comments#create'
  post '/update_status' => 'blogs#update_status'
  # resources :admin
  get "/admin", to: "admin#index" 
  get "/admin/user", to: "users#index"
  get "/admin/blog", to: "blogs#index"
  get "admin/categories", to: "categories#index"


  get "contact", to: "gioithieu#index"



  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
