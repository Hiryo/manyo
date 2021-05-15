Rails.application.routes.draw do
  root 'users#new'
  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :tasks do
    collection do
      get :search
      post :confirm
    end
  end
end
