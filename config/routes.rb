Rails.application.routes.draw do

  root 'home#index'

  resources :lists, only: :index do
    collection do
      get 'users'
      get 'datatables'
      get 'products'
    end
  end

  resources :reports, only: :index do
    collection do
      get 'orders'
      get 'sales'
    end
  end

  resources :forms, only: :index do
    collection do
      get 'new_customer'
      get 'new_product'
      get 'wizard'
    end
  end

  resources :pages, only: :index do
    collection do
      get 'inbox'
      get 'profile'
      get 'latest_activity'
      get 'projects'
      get 'steps'
      get 'calendar'
    end
  end

  resources :pricing, only: :index do
    collection do
      get 'plans'
      get 'charts'
      get 'form'
      get 'invoice'
    end
  end

  resources :features, only: :index do
    collection do
      get 'email_templates'
      get 'gallery'
      get 'ui'
      get 'api'
      get 'signup'
      get 'signin'
      get 'status'
    end
  end

  resources :account, only: :index do
    collection do
      get 'settings'
      get 'billing'
      get 'notifications'
      get 'support'
    end
  end
end
