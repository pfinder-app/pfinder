Rails.application.routes.draw do
  root 'hello_world#index'
  scope :api do
    resources :users
    resources :activities
  end
end
