Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :users, only: [:index, :create]

  post "/auth/create", to: "auth#create"
  get "/auth/show", to: "auth#show"

end
