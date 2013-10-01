ARIS::Application.routes.draw do
  resources :offices


  resources :classrooms


  resources :buildings


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => 'home#index'
  devise_for :users
  resources :users

end