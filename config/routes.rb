Rails.application.routes.draw do
  jsonapi_resources :pages, only: [:index, :create, :show]
end
