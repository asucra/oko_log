Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users, controllers: { registrations: 'users/registrations', \
  confirmations: 'users/confirmations'}

  resource :profile, only: %i[show]
  root to: "welcomes#index"
  resources :anger_logs, only: %i[index new create edit update destroy]
  get "homes" => "homes#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
