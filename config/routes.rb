Rails.application.routes.draw do
  get '/sign_in', to: 'sessions#new'
  get 'sessions/create'
  get '/sign_out', to: 'sessions#destroy'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
