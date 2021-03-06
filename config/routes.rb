Rails.application.routes.draw do
  get 'users/create'
  get 'users/update'
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/delete'
  get 'orders/index'
  get 'orders/show'
  get 'checkout/index'

  devise_for :users
  get 'furnitures/index'
  get 'furnitures/show'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :furnitures, only: %i[index show]
  resources :categories, only: %i[index show]
  resources :cart, only: %i[create update destroy quantityIncrease quantityDecrease]
  resources :orders, only: %i[create]
  resources :order_items, only: %i[create]
  resources :users, only: %i[create, update]

  scope "/checkout" do
    post "create", to: "checkout#create", as: "checkout_create"
    get "success", to: "checkout#success", as: "checkout_success"
    get "cancel", to: "checkout#cancel", as: "checkout_cancel"
  end

  resources :furnitures do
    collection do
      match 'search' => 'furnitures#search', via: [:get, :post], as: :search
    end
  end

  root to: "furnitures#index"
end
