Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'top#index'
  post '/logout' => 'top#log_out'
  get '/login' => 'login#index'
  post '/login' => 'login#create'
  resources :register
end
