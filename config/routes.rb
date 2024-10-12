Rails.application.routes.draw do
  root to: "welcome#index"
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations: "user/registrations"
  }
  devise_for :users
end
