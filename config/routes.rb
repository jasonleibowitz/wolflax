Rails.application.routes.draw do
  devise_for :users
  resources :users
  get '/about' => 'home#about'
  get '/faq' => 'home#faq'
  get '/contact' => 'home#contact'
  root to: 'home#welcome'
end
