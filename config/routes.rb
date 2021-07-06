Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  authenticated :user do
    namespace :arrows do
      root to: 'home#show'
    end
  end
end
