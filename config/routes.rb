Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :chatrooms, only: [:new, :create, :show, :index, :destroy]
  root to: 'pages#home'

  get "/login" => 'sessions#new', :as => 'login'
  post "/login" => 'sessions#create'
  delete "/login" => 'sessions#destroy'

end
