Rails.application.routes.draw do
  resources :calendar, only: [:index, :show]

  resources :artists, only: [:index] do
    resources :follows, only: [:create, :destroy]
  end

  delete "follows" => 'follows#destroy_many'

  get 'map' => 'calendar#map'

  get 'newsfeed' => 'post#index'

  devise_for :users, :controllers => { :registrations => :registrations }

  resources :users, only: [:update, :show]
  
  get 'about' => 'welcome#about'

  root to: 'welcome#index'
end