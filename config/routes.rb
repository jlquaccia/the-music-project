Rails.application.routes.draw do
  get 'newsfeed' => 'post#index'

  devise_for :users
  resources :users, only: [:update, :show]
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end