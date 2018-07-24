Rails.application.routes.draw do
  
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  get 'welcome/index'
  root 'welcome#index'

  resources :users

  get '/iss', to: 'iss#index'
end
