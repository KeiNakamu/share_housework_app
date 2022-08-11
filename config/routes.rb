Rails.application.routes.draw do
  resources :articles do
    resources :procedures
  end
end
