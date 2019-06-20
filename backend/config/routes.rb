# frozen_string_literal: true

Rails.application.routes.draw do
  root 'hello_world#index'
  scope :api do
    resources :me, only: %i[index create update]
    resources :activities, except: %i[new edit] do
      resources :participations, shallow: true, except: %i[new edit update]
    end
  end
end
