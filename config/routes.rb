Rails.application.routes.draw do
  devise_for :users
  resources :users do
    member do
      get :followings, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  root 'articles#index'
  resources :articles do
    resources :procedures
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :favorites, only: [:index, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
