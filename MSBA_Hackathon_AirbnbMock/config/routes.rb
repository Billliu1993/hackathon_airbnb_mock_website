Rails.application.routes.draw do
  get 'room/index'
  get 'room/new'
  get 'room/create'

  get 'room/update'
  root 'pages#home'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]
  resources :rooms, except: [:edit] do
    member do
      get 'listing'
      get 'pricing'
      get 'description'
      get 'photo_upload'
      get 'amenities'
      get 'location'
    end
    resources :photos, only: [:create, :destroy]
    resources :reservations, only: [:create]
  end

  get 'search' => 'pages#search'
end
