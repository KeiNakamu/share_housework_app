Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
    post 'users/admin_guest_sign_in', to: 'users/sessions#new_admin_guest'
  end
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
    collection do
      get 'search'
    end
  end
  resources :favorites, only: [:index, :create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
