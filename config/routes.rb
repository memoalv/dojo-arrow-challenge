Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  authenticated :user do
    namespace :arrows do
      root to: 'arrows#show'
    end
  end
end
