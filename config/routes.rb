Rails.application.routes.draw do  
    root "main#index"

    resources :users
    resources :albums

    get '/login', to: 'session#index'
    post '/login', to: 'session#create'
    get '/logout', to: 'session#destroy'
    post '/logout', to: 'session#destroy'

    get '/packages', to: 'packages#index'
    post '/packages/checkout', to: 'packages#checkout'
    get '/about', to: 'about#index'
    get '/contact', to: 'contact#index'
    post '/contact', to: 'contact#index'
    get '/gallery', to: 'gallery#index'
    get '/gallery/album/:id', to: 'gallery#album'
end