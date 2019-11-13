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
    resources :post_images
    resources :game_records, only: [:new, :create, :update, :destroy]
    resources :favorites
    resources :selections
    resources :answers
    resources :reports, only: [:show]
    resources :users, only: [:show, :edit, :update, :index, :destroy] do
      resources :reports, only: [:create]
    end
    root to: 'post_images#index'
  end
end
