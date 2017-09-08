Rails.application.routes.draw do
  get '/main', to: 'pages#main', as: :pages
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :products
end
