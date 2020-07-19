Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'items#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create, :destroy] do
    member do
      get :likes
    end
  end
  
  resources :items
  resources :likes, only: [:create, :destroy]
  
  get 'test', to: 'tests#index'
  get 'about', to: 'abouts#index'
end
