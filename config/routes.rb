Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  namespace :v1 do
    get '/all-products' => 'products#show_products'
    get '/bike' => 'products#bike'
    get '/skateboard' => 'products#skateboard'
    get '/scooter' => 'products#scooter'
  end

  namespace :v2 do
    get '/all-products' => 'products#show_products'
    get '/bike' => 'products#bike'
    get '/skateboard' => 'products#skateboard'
    get '/scooter' => 'products#scooter'
  end

  namespace :v3 do
    get '/all-products' => 'products#show_products'
    get '/bike' => 'products#bike'
    get '/skateboard' => 'products#skateboard'
    get '/scooter' => 'products#scooter'
    get '/any-product' => 'products#query_product'
    get '/the-product/:id' => 'products#query_product'
  end

  namespace :v4 do
    get '/products' => 'products#index' 
    get '/products/:id' => 'products#show'
    post '/products' => 'products#create'
    patch '/products/:id' => 'products#update'
    post '/users' => 'users#create'
    post '/orders' => 'orders#create'
    get '/orders' => 'orders#index'
    post '/carted_products' => 'carted_products#create'
    get '/carted_products' => 'carted_products#index'
    delete '/carted_products/:id' => 'carted_products#destroy'
  end
end
