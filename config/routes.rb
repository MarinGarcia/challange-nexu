Rails.application.routes.draw do
  get '/brands', to: 'brands#index'
  get '/brands/:id/models', to: 'brands#show'
  post '/brands', to: 'brands#create'
  post '/brands/:id/models', to: 'models#create'
  put '/models/:id', to: 'models#update'
  get 'models', to: 'models#show'
end
