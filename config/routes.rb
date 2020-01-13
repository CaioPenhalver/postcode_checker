# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'whitelist#index'
  resources :postcodes
  resources :districts
  resources :whitelist, only: :index, path: 'service-area' do
    get '/search', action: 'search', on: :collection
  end
end
