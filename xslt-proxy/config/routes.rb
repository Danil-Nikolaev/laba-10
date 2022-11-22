Rails.application.routes.draw do
  get 'proxy/input'
  get 'proxy/output'

  get '/output' => 'proxy#output'
  root 'proxy#input'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
