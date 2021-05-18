Rails.application.routes.draw do
  root 'tasks#index'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks do
    collection do
      get :search
      post :confirm
    end
  end
  namespace :admin do
    resources :users
  end
end