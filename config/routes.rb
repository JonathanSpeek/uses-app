Rails.application.routes.draw do
  get 'welcome/index'

  resources :things

  get 'auth/:provider/callback', to: 'sessions#create'

  root 'welcome#index'
end
