Amicrazy::Application.routes.draw do
  
  resources :users
  resources :sessions, :only => [:new, :create, :destroy]
  resources :posts, :only => [:create, :destroy]
  
  match '/help', :to => 'pages#help'
  match '/signup', :to => 'users#new'
  match '/signin', :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/submit', :to =>'pages#submit'

  root :to => 'pages#welcome'
  
end
