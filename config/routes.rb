Rails.application.routes.draw do
  root 'messages#index'
  devise_for :users
  resources :groups do
    resources :messages, only: [:index]
  end
end
