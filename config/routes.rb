Rails.application.routes.draw do
  root "payments#index"
  resources :payments, only: %w[index new create edit update destroy]
end
