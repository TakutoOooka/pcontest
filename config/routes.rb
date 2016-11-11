Rails.application.routes.draw do
  devise_for :users
  get 'users/:id' => 'users#show'   #MypageへのRouting
  resource :products, only: [:create, :new, :update]
  get 'products/popular_products' => 'products#popular_products'
  get 'products/fresh_products' => 'products#fresh_products'
  get 'products/:id' => 'products#show'
  get 'products/:id/edit' => 'products#edit'
  delete 'products/:id/destroy' => 'products#destroy'
  patch 'products/:id/update' => 'products#update'
  post 'reviews/create/:product_id' => 'reviews#create'
  delete 'reviews/destroy/:review_id' => 'reviews#destroy'
  
  resource :top, only: [:index, :show]
  root to: 'top#index'
end
