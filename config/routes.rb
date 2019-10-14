Rails.application.routes.draw do
  root 'home#index'
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }

  namespace :profiles do
    resources :users
  end

  resources :users, :only => [:show], as: :mypage
end
