Rails.application.routes.draw do
  get "orders/index"
  get "orders/show"
  get "orders/create"
  get "order_items/new"
  get "order_items/create"
  get "order_items/index"
  get "order_items/show"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users
  resources :orders, only: [ :index, :show, :create ]
  resources :order_items, only: [ :new, :create, :index, :show ]
  resources :products
  resources :cart_items, only: [ :create, :update, :destroy ]
  resource :cart, only: [ :show ]
  resources :orders, only: [ :new, :create, :index, :show ]
  get "up" => "rails/health#show", as: :rails_health_check
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  root "products#index"
  resources :cart_items do
    member do
      patch "increase"
      patch "decrease"
    end
  end
end
