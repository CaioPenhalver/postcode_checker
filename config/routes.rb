# frozen_string_literal: true

Rails.application.routes.draw do
  resources :postcodes, except: :index
  resources :districts, except: :index
end
