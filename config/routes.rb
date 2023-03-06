Rails.application.routes.draw do    
    root "main#index"

    resources :users, :bookings, :contacts, :albums, :comments

    resources :albums do 
        resources :comments

        resources :delete_image, to: 'albums#delete_image'
        resources :delete_thumbnail, to: 'albums#delete_thumbnail'
    end

    get '/login', to: 'session#index'
    post '/login', to: 'session#create'
    get '/logout', to: 'session#destroy'
    post '/logout', to: 'session#destroy'

    get '/packages', to: 'packages#index'
    get '/packages/checkout', to: 'packages#checkout'
    post '/packages/create', to: 'packages#create'
    get '/packages/confirmation', to: 'packages#confirmation'

    get '/about', to: 'about#index'

    get '/contact-us', to: 'contact_us#index'
    post '/contact-us/create', to: 'contact_us#create'
    
    get '/gallery', to: 'gallery#index'
    get '/gallery/show/:id', to: 'gallery#show', as: 'gallery_show'
end