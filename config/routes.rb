Rails.application.routes.draw do
  get 'welcome/index'

  resources :things

  root 'welcome#index'
end
