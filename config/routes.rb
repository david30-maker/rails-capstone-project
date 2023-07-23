Rails.application.routes.draw do
  devise_for :users

  root 'home#splash'
  resources :group do
    member do
      post 'add_item', to: 'group#add_item'
    end
  end
  resources :item do
    member do
      post 'add_group', to: 'item#add_group'
    end
  end

end

