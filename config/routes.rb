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
  post '/answers/:answer_id/likes' => "likes#create"
  delete '/answers/:answer_id/likes' => "likes#destroy"
  
  #get 'questions' => 'questions#index'
  #get 'answers/new/:questionId' => 'answers#new'
  #get 'reactions/new/:answerId' => 'reactions#new'

end
