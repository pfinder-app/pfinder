Rails.application.routes.draw do
  root 'hello_world#index'
  scope :api do
    resources :users
    devise_for :users, controllers: {sessions: 'sessions'}
    devise_scope :user do
      get 'users/current', to: 'sessions#show'
    end
  end
end
