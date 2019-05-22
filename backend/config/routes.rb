Rails.application.routes.draw do
  root 'hello_world#index'
  scope :api do
    resources :me, only: %i[index create update]
  end
end
