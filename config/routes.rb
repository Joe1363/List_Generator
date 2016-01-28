Rails.application.routes.draw do
  root 'lists#main'
  resources :lists
  get 'users/:id', to: 'users#show'
  devise_for :users, :controllers => { registrations: 'registrations' }
end
