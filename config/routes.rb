Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :clinics
  resources :camps
  resources :charges
  resources :students
  resources :campers
  get '/about' => 'home#about'
  get '/faq' => 'home#faq'
  get '/contact' => 'home#contact'
  get '/admin/clinics' => 'clinics#adminview'
  root to: 'home#welcome'
end
