Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    resources :measureds
    resources :goals
    resources :filter_by_measurement_id_measureds
  end
  resources :measurements
end
