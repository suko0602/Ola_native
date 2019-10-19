Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }
  resources :profiles, only: %i(show edit update) 
  resources :questions
  resources :answers 
end
