Rails.application.routes.draw do
  devise_for :users
  get 'users/:id' => 'users#show'   #MypageへのRouting
  resource :products, only: [:create, :new, :edit, :update]
  get 'products/popular_products' => 'products#popular_products'
  get 'products/fresh_products' => 'products#fresh_products'
  get 'products/:id' => 'products#show'
  get 'products/:id/edit' => 'products#edit'
  delete 'products/:id/destroy' => 'products#destroy'
  resource :reviews, only: [:new, :edit, :show, :update, :destroy]
  post 'reviews/:product_id/create' => 'reviews#create'
  
  resource :top, only: [:index, :show]
  root to: 'top#index'
end
