Rails.application.routes.draw do
  devise_scope :user do
    authenticated :user do
      # root to: 'users#index', as: :authenticated_root
    end
    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end

    devise_for :users
  end
end
