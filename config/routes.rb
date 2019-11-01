Rails.application.routes.draw do
  devise_for :users

  namespace :common do
    resources :dashboard, only: %i[index]

    resources :media
    resources :schedules
    resources :devices

    root to: 'dashboard#index'
  end

  root to: redirect('/common')
end
