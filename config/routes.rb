Rails.application.routes.draw do
  root 'articles#index'
  resources :articles do
    resources :procedures
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
