Rails.application.routes.draw do
  root 'home#index'
  resources :warehouses, only: [:show, :create, :new]
end
