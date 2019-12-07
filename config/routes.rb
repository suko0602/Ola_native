Rails.application.routes.draw do

  root 'home#index'
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }
  resources :users
  resources :profiles, only: %i(show update edit)
  resources :questions do 
    resources :answers, only: %i(create destroy) 
  end
  resources :answers, only: %i(create destroy) do
    resources :likes, only: %i(create)
  end 

end
