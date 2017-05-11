Rails.application.routes.draw do
  root 'groups#index'
  devise_for :users
  resources :groups, shallow: true do
    resources :messages, only: [:index, :create]
  end
  get 'users/search' => 'users#search'
end
