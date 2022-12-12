Rails.application.routes.draw do
  root "solution#input"
  post 'solution/show'
  get 'solution/list'
  resource :sessions, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
