Rails.application.routes.draw do
  get 'furniture/index'
  get 'furniture/show'
  # get 'furnitures/index'
  # get 'furnitures/show'
  # get 'products/index'
  # get 'products/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :furniture, only: %i[index show]

  root to: "furniture#index"
end
