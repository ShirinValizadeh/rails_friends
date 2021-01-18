Rails.application.routes.draw do
  devise_for :users
  resources :friends
  #get 'home/index'
  get 'home/about'
  root 'friends#index'
  # root 'home#index'     #show home page after localhost:3000
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
