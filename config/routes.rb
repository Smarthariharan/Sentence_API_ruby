Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'panels#index'
  get '/panels', to: 'panels#index'
  get '/get_data', to: 'panels#get_data'
  get '/panels/new', to: 'panels#new'
  post '/post_data', to: 'panels#create'

  resources :panels 



  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.


  # Defines the root path route ("/")
  # root "posts#index"
end
