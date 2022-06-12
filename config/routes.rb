Rails.application.routes.draw do
  root "payments#index"
  resources :payments, only: %w[index new show create edit update destroy]
end
