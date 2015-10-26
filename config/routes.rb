Rails.application.routes.draw do
  resources :calendar, only: [:index, :show]

  # get 'search' => 'artists#index'
  resources :artists, only: [:index]

  get 'newsfeed' => 'post#index'

  devise_for :users
  resources :users, only: [:update, :show]
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end