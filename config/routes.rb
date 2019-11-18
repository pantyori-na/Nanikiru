Rails.application.routes.draw do
  # namespace :manager do
  #     devise_for :admin_users, controllers: {
  #     sessions: 'manager/admin_users/sessions',
  #     registrations: 'manager/admin_users/registrations',
  #     passwords: 'manager/admin_users/passwords'
  #   }
  # end
  scope module: 'site' do
    devise_for :users, controllers: {
      sessions: 'site/users/sessions',
      registrations: 'site/users/registrations',
      passwords: 'site/users/passwords'
    }
    resources :post_images do
      resources :answers, only: [:create, :show]
      get 'like', to: 'favorites#like'
      get 'unlike', to: 'favorites#unlike'
    end
    resources :game_records, only: [:new, :create, :update, :destroy]
    resources :selections
    resources :answers
    resources :post_comments
    resources :reports, only: [:show]
    resources :users, only: [:show, :edit, :update, :index, :destroy] do
      resources :reports, only: [:create]
    end
    resources :relationships, only: [:create, :destroy]
    root to: 'post_images#index'
  end
end
