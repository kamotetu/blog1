Rails.application.routes.draw do

  devise_for :users
  root   'blogs#index'
  resources :blogs
  resources :users, only: :show
  # get    'blogs'            => 'blogs#index'
  # get    'blogs/new'        => 'blogs#new'
  # post   'blogs'            => 'blogs#create'
  # delete 'blogs/:id'        => 'blogs#destroy'
  # patch  'blogs/:id'        => 'blogs#update'
  # get    'blogs/:id/edit'   => 'blogs#edit'
  # get    'users/:id'        => 'users#show'
end
