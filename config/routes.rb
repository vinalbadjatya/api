Rails.application.routes.draw do
  resources :posts do
    resources :comments
  end

  resources :users
  post 'auth/login', to: 'authentications#login'
  # resources :meetings ,only: [:create]

  get 'meetings/zoom'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
