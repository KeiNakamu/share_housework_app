Rails.application.routes.draw do
  devise_for :users
  root 'articles#index'
  resources :articles do
    resources :procedures
    resources :comments
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
