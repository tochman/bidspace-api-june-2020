# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'api/v1/auth'
  mount ActionCable.server => '/cable'

  namespace :api do
    namespace :v1 do
      resources :listings, only: %i[index show create], constraints: { format: 'json' }
      resources :subscriptions, only: [:create], constraints: { format: 'json' }
      resources :biddings, only: %i[create update], constraints: { format: 'json' } do
        resources :messages, only: [:create]
      end

      namespace :account do
        resources :listings, only: %i[index show update], constraints: { format: 'json' }
        resources :biddings, only: [:index], constraints: { format: 'json' }
      end
    end
  end
end
