Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/merchants/find', to: 'merchant_search#show'
      resources :merchants, only: [:index, :show] do
        get '/items', to: 'merchant_items#index'
      end
      get '/items/find_all', to: 'item_search#index'
      resources :items do
        get '/merchant', to: 'item_merchant#show'
      end
    end
  end
end
