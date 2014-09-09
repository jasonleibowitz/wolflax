Rails.application.routes.draw do
  devise_for :users
  resources :users
  get '/about' => 'home#about'
  root to: 'home#welcome'
end
