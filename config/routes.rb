Rails.application.routes.draw do
  # devise_for :administrators, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  devise_for :users, controllers: {
    confirmations:      "users/devise/confirmations",
    # omniauth_callbacks: "users/devise/omniauth_callbacks",
    passwords:          "users/devise/passwords",
    registrations:      "users/devise/registrations",
    sessions:           "users/devise/sessions",
    unlocks:            "users/devise/unlocks"
  }
  
  
  # you can remove template routes when there is no use for them anymore
  draw :pages


  match '/404', to: 'errors#error_404', via: [:get, :post]
  match '/422', to: 'errors#error_422', via: [:get, :post]
  match '/500', to: 'errors#error_500', via: [:get, :post]

  root 'pages/home#index'
end
