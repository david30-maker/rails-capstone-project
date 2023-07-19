Rails.application.routes.draw do

  devise_for :users
  
  resources :groups, only: [:index, :new, :create] do
    resources :items, only: [:index, :new, :create]
  end
  
  root to: "splash#index"
  
end

