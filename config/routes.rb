Rails.application.routes.draw do
  root 'home#index'
  resources :warehouses, only: [:show, :create, :new, :update, :edit, :destroy]
  resources :suppliers, only: [:index, :show, :create, :new, :edit, :update]
end
