Rails.application.routes.draw do
  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'

  resources :users do
  	resources :activities, only: [:index]
  end

  resources :sessions, only:[:create]

  resources :activities, only:[:new,:create,:show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
end
