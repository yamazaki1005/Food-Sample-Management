# frozen_string_literal: true

Rails.application.routes.draw do

  root 'cookings#index'

  devise_for :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :products
  resources :cookings
end
