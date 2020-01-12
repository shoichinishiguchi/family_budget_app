Rails.application.routes.draw do
  namespace :admin do
    resources :users
  end
  resources :users

  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :families, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :budget_groups, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :budget_items, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      post 'next_month'
    end
  end
  root 'budget_groups#index'
end
