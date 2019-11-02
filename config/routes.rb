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
    resources :users, only: :edit
  end

  root to: redirect('/common')
end
