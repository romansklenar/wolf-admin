Rails.application.routes.draw do
  # you can remove template routes when there is no use for them anymore
  draw :pages

  root 'pages/home#index'
end
