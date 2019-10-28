Rails.application.routes.draw do

  root 'home#index'
  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }

  resources :profiles, only: %i(show edit update) 
  resources :questions do 
    resources :answers, only: [:create, :destroy]
  end
  
  #get 'questions' => 'questions#index'
  #get 'answers/new/:questionId' => 'answers#new'
  #get 'reactions/new/:answerId' => 'reactions#new'

end
