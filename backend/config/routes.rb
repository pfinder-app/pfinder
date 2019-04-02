Rails.application.routes.draw do
  root 'hello_world#index'
  scope :api do
    resources :users, except: %i[index new edit destroy]
  end
end
