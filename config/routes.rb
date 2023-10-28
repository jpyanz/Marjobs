Rails.application.routes.draw do
    root "main#index"

    # for contact us submission in index
    post '/create', to: 'main#create'

    resources :users, :meetings, :bookings, :contacts, :comments, :categories, :packages, :addons

    resources :albums do
        resources :comments

        resources :delete_file, to: 'albums#delete_file'
        resources :delete_thumbnail, to: 'albums#delete_thumbnail'
    end

    get '/login', to: 'session#index'
    post '/login', to: 'session#create'
    get '/logout', to: 'session#destroy'
    post '/logout', to: 'session#destroy'

    get '/checkout', to: 'checkout#index'
    get '/checkout/new', to: 'checkout#new'
    post '/checkout/create', to: 'checkout#create'
    get '/checkout/confirmation', to: 'checkout#confirmation'

    post '/checkout/meetings/create', to: 'checkout#meetings_create'

    get '/about', to: 'about#index'

    get '/contact-us', to: 'contact_us#index'
    post '/contact-us/create', to: 'contact_us#create'

    get '/gallery', to: 'gallery#index'
    get '/gallery/show/:id', to: 'gallery#show', as: 'gallery_show'
end