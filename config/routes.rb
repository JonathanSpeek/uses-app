Rails.application.routes.draw do
  get 'welcome/index'

  resources :things do
    member do
      get "upvote"
      get "undo_upvote"
    end
  end

  resources :users, only: [:edit, :update, :destroy]

  get 'auth/:provider/callback', to: 'sessions#create'

  root 'welcome#index'
end
