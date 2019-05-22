# frozen_string_literal: true

Rails.application.routes.draw do
  root 'hello_world#index'
  scope :api do
    resources :me, only: %i[index create update]
    resources :activities
  end
end
