Rails.application.routes.draw do
  devise_for :users
  namespace :api, defaults: {format: :json} do
    resources :customers do
      resources :orders_for_single_customer, only: [:index]
      resources :categories_purchased_for_single_customer, only: [:index]
    end
    resources :orders do
      resources :order_item
    end
    resources :products do
      resources :products_per_timeperiod, only: [:index]
    end
    resources :category, only: [:index]
  end
end
