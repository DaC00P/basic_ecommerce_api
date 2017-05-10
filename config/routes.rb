Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: {format: :json} do
    resource :login, only: [:create], controller: :sessions
    resources :orders do
      resources :order_item
    end
    resources :products
  end
end
