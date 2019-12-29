Rails.application.routes.draw do
  get 'users/new'
  get 'users/edit'
  get 'users/show'
  get 'sessions/new'
  namespace :admin do
    resources :users
  end
  resources :users

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login',  to: 'sessions#create'




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#new'
  resources :families, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
