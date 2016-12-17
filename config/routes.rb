Rails.application.routes.draw do
  root 'messages#index'
  devise_for :users
  resources :messages, only: [:index]
  resources :groups, only: [:new, :edit]
end
