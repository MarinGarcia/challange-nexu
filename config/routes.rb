Rails.application.routes.draw do
  get '/brands', to: 'brands#index'
  get '/brands/:id/models', to: 'brands#show'
  post '/brands', to: 'brands#create'
end
