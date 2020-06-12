# frozen_string_literal: true

Rails.application.routes.draw do

  root 'homes#index'

  devise_for :users
  resources :users

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :products

  resources :cookings do
    resource :cooking_product_relations, only: [:create, :destroy]
    collection do
      get 'foodstuff'
    end
  end

  resources :cooking_categories
  resources :introductions
end
