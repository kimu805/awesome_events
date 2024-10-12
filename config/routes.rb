Rails.application.routes.draw do
  root to: "welcome#index"
    registrations: "user/registrations"
  }
  devise_for :users
end
