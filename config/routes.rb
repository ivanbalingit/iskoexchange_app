Rails.application.routes.draw do
  resources :questions

  get  '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
  get    '/login',  to: 'sessions#new'
  post   '/login',  to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'home#index'
end
