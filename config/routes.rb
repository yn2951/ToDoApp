Rails.application.routes.draw do
  root 'pages#index'

  resources :pages
  resources :users
  resources :topics

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/date_update', to: 'topics#date_update'
end
