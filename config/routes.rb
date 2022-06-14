Rails.application.routes.draw do
  root "monthly_expenses#show"
  resources :payments, only: %i[new create edit update destroy]
  get "monthly_expenses/:year/:month", to: "monthly_expenses#show", as: "monthly_expenses"

  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"
  resources :users, only: %i[edit update destroy]
  resources :confirmations, only: [:create, :edit, :new], param: :confirmation_token
end
