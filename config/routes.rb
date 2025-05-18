Rails.application.routes.draw do
  # Page d'accueil -> Dashboard si connecté, Login si non connecté
  root 'dashboard#index'
  
  # Routes pour les sessions (connexion/déconnexion)
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # Dashboard
  get '/dashboard', to: 'dashboard#index'
  
  # Routes pour les utilisateurs et autres ressources
  resources :users, except: [:destroy]
  resources :schools, only: [:index, :show] do
    resources :information, only: [:index, :new, :create]
  end
  
  resources :councils, only: [:index, :show] do
    resources :attendances, only: [:create, :update]
    resources :reports, only: [:new, :create, :edit, :update]
  end
  
  resources :information, only: [:show, :edit, :update, :destroy]
  resources :reports, only: [:index, :show]
  
  # Espace d'administration
  namespace :admin do
    get '/', to: 'dashboard#index', as: :root
    resources :users
    resources :schools
    resources :associations
    resources :councils
    resources :reports, only: [:index, :show]
  end
end