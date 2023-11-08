Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  root 'top#main'
  # Defines the root path route ("/")
  # root "articles#index"
end
