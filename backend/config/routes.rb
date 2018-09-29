Rails.application.routes.draw do
  root 'hello_world#index'
  scope :api do
    resources :users
  end
end
