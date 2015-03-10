Rails.application.routes.draw do

  namespace :api do
    resources :url_maps
  end

  root 'home#index'
  
  get '*token' => 'home#show', as: 'shortner'
end
