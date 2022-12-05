Rails.application.routes.draw do
  root "db#index"
  get 'db/show'
  get 'db/render_db'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
