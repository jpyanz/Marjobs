Rails.application.routes.draw do  
    root "main#index"

    resources :users

    get '/login', to: 'session#index'
    post '/login', to: 'session#create'
    get '/logout', to: 'session#destroy'
    post '/logout', to: 'session#destroy'

    get '/packages', to: 'packages#index'
    get '/about', to: 'about#index'
    get '/contact', to: 'contact#index'
end