Rails.application.routes.draw do
  root 'lists#main'
  resources :lists
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'users/:id', to: 'users#index'
end
