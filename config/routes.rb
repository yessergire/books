Books::Application.routes.draw do
  resources :reviews

  resources :users

  resources :publishers

  resources :books

  resources :genres

  resources :authors

  resources :book_authors

  resources :book_genres

  resources :users

  resources :sessions, :only => [:new, :create]

  root 'books#index'

  get 'signup' => 'users#new'

  get 'signin' => 'sessions#new'

  delete 'signout' => 'sessions#destroy'
end
