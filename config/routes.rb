Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    resources :groups, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
      resources :items, only: [:index, :show, :new, :create, :edit, :update, :destroy]
    end
  end
end
