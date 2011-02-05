MizugumoDemo::Application.routes.draw do
  get "home/index"

  resources :products
  match 'test', :to => 'test#index'

  match 'login', :to => 'login#new', :as => :login
  match 'authenticate', :to => 'login#create', :as => :authenticate, :via => :post

  match 'license', :to => 'home#license', :as => :license
  match 'playground', :to => 'test#playground', :as => :playground
  root :to => 'home#index'
end
