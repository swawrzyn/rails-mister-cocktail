Rails.application.routes.draw do
  resources :cocktails do
    resources :doses
    resources :reviews, only: [:new, :create]
  end
  root to: 'cocktails#index'
end
