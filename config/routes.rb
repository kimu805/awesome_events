Rails.application.routes.draw do
  root to: "welcome#index"
  devise_for :users
  resources :events do
    resources :tickets
  end
  resources :retirements
end
