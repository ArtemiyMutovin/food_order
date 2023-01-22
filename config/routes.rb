# frozen_string_literal: true

Rails.application.routes.draw do
  root 'orders#index'

  get 'dishes_count', to: 'orders#dishes_count'

  resources :orders
end
