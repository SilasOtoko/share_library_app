PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/register', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/home', to: 'posts#home'

  resources :posts do
    member do
      post :vote
    end

    resources :comments, only: [:create, :edit] do
      member do
        post :vote
      end
    end
  end
  resources :categories, only: [:show, :create, :new]
  resources :users
end
