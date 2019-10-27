Rails.application.routes.draw do
  devise_for :users

  namespace :common do
    resources :dashboard, only: %i[index]

    resources :media, only: %i[index]
    resources :schedules, only: %i[index]
    resources :devices, only: %i[index]

    root to: 'dashboard#index'
  end

  root to: redirect('/common')
end
