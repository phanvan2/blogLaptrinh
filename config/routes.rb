Rails.application.routes.draw do
  get 'admin/index'
  get 'thong_ke/index'
  resources :reply_comments
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
  post 'session' => 'session#create'
  get '/logout' => 'session#destroy'
  get 'user/:id/profile', to: 'users#show'
  get 'user/:id/update', to: 'users#edit'
  get '/login' => 'session#index'
  get '/search' => 'search_blog#index'
  post '/comments1/create' => 'comments#create'
  post '/reply_comments/create' => 'reply_comments#create'
  post '/update_status' => 'blogs#update_status'
  get '/contact', to: 'articles#contact'

  get '/admin/thongke' => 'admin#thongke'
  get "/admin/user", to: "admin#qlUser"
  get "/admin/categories", to: "admin#qlCategory"
  get "/admin/blog", to: "admin#qlBlog"
  get "/admin/comment", to: "admin#qlComment"
  post '/update_quyen' => 'admin#update_quyen'
  get '/admin/new/categories', to: "categories#new"


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
