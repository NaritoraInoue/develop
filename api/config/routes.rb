Rails.application.routes.draw do
  get '/decryptionkey/show/:safe_number', controller: :application, action: :show
  post '/decryptionkey/regist', controller: :application, action: :create
  get '*wrong_routes', controller: :application, action: :wrong
  post '*wrong_routes', controller: :application, action: :wrong
end
