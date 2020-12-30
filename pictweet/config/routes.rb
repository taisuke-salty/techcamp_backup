Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tweets#index'
  # get 'tweets' => 'tweets#index'
  # get 'tweets/new'  => 'tweets#new'
  # post 'tweets' => 'tweets#create'
  # get 'users/:id'  => 'users#show'
  # delete 'tweets/:id' => 'tweets#destroy'
  # get 'tweets/:id/edit' => 'tweets#edit' 
  # patch 'tweets/:id' => 'tweets#update'
  # get 'tweets/:id' => 'tweets#show'
  resources :tweets do
    resources :comments, only: [:create]
  end
  resources :users, only: [:show]
  
  
  get '/work' => 'tweets#work'
  get '/work2' => 'tweets#work2'

  
end
