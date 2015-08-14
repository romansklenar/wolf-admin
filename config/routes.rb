Rails.application.routes.draw do
  devise_for :users
  
  
  # you can remove template routes when there is no use for them anymore
  draw :pages


  match '/404', to: 'errors#error_404', via: [:get, :post]
  match '/422', to: 'errors#error_422', via: [:get, :post]
  match '/500', to: 'errors#error_500', via: [:get, :post]

  root 'pages/home#index'
end
