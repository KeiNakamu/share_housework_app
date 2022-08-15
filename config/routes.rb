Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  resources :users, only: %i[ show edit update ]
  resources :relationships, only: [:create, :destroy]
  root 'articles#index'
  resources :articles do
    resources :procedures
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :favorites, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
