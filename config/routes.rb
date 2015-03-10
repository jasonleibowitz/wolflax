Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :clinics
  get 'camps/reports/' => 'camps#reports'
  get 'camps/reports/:id' => 'camps#reports'
  resources :camps
  resources :charges
  resources :students
  resources :campers
  get '/about' => 'home#about'
  get '/about/jordan' => 'home#jordan'
  get '/about/staff' => 'home#staff'
  # get '/faq' => 'home#faq'
  # get '/contact' => 'home#contact'
  get '/admin/clinics' => 'clinics#adminview'
  root to: 'home#welcome'
end
