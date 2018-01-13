Rails.application.routes.draw do
  #Sales routes
  resources :sales, except: [:show]

  #Upload routes
  post 'upload', to: 'upload#create'
  get 'upload', to: 'upload#show'

  #Default root
  root 'home#index'
end
