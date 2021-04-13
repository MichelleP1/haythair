Rails.application.routes.draw do
  devise_for :users
  get 'furnitures/index'
  get 'furnitures/show'
  # get 'categories/index'
  # get 'categories/show'
  # get 'furniture/index'
  # get 'furniture/show'
  # get 'furnitures/index'
  # get 'furnitures/show'
  # get 'products/index'
  # get 'products/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :furnitures, only: %i[index show]
  resources :categories, only: %i[index show]
  resources :cart, only: %i[create destroy]

  root to: "furnitures#index"
end
