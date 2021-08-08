# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :measureds
    resources :goals
    resources :filter_by_measurement_id_measureds
    resources :filter_by_date_measureds
    resources :measurements do
      resources :measureds
    end
  end
  resources :measurements
  post '/login', to: 'auth#login'
  get '/auto_login', to: 'auth#auto_login'
  get '/user_is_authed', to: 'auth#user_is_authed'
end
