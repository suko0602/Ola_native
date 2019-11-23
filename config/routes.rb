Rails.application.routes.draw do

  root 'home#index'
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }
  resources :users 
  resources :profiles, only: %i(show edit update) 
  resources :questions do 
    resources :answers, only: %i(create destroy)
  end
  resources :answers do 
    resources :likes, only: %i(create destroy)
  end 

end
