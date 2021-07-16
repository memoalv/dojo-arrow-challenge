Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  authenticated :user do
    namespace :arrows do
      root to: 'arrows#index'
      post '/', to: 'arrows#create'
    end
  end
end
