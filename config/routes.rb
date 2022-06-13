Rails.application.routes.draw do
  root "monthly_expenses#show"
  resources :payments, only: %i[new create edit update destroy]
  get "monthly_expenses/:year/:month", to: "monthly_expenses#show"
end
