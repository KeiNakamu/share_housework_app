Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[ show edit update ]
  root 'articles#index'
  resources :articles do
    resources :procedures
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
