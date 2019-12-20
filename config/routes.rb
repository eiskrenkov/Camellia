Rails.application.routes.draw do
  devise_for :users

  namespace :common do
    resources :dashboard, only: :index

    resources :media
    resources :schedules
    resources :devices

    root to: 'dashboard#index'
  end

  namespace :admin do
    resources :dashboard, only: :index
    resources :users, only: :edit do
      post :create, on: :collection
    end
  end

  namespace :api do
    resources :devices, only: [] do
      get :schedule, on: :collection
    end
  end

  root to: redirect('/common')
end
