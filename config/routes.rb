Rails.application.routes.draw do
  resources :calendar, only: [:index, :show]

  resources :artists, only: [:index] do
    resource :follows, only: [:create, :destroy]
  end

  get 'newsfeed' => 'post#index'

  devise_for :users
  resources :users, only: [:update, :show]
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end