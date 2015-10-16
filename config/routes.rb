Rails.application.routes.draw do
  resources :posts, only: [:show]
  get 'newsfeed' => 'post#index'

  devise_for :users
  resources :users, only: [:update, :show]
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end