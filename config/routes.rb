ARIS::Application.routes.draw do
  resources :states


  resources :reservations


  resources :events


  resources :areas


  resources :offices


  resources :classrooms


  resources :buildings


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => 'home#index'
  devise_for :users
  resources :users

  #Errors routing
  match '*a', :to => 'errors#error_404'
  unless Rails.application.config.consider_all_requests_local
    match '*not_found', to: 'errors#error_404'
  end

end