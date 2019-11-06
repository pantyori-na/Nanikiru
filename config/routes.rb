Rails.application.routes.draw do
  namespace :site do
    resources :reports
  end
  namespace :manager do
      devise_for :admin_users, controllers: {
      sessions: 'manager/admin_users/sessions',
      registrations: 'manager/admin_users/registrations',
      passwords: 'manager/admin_users/passwords'
    }
  end
  scope module: 'site' do
    devise_for :users, controllers: {
      sessions: 'site/users/sessions',
      registrations: 'site/users/registrations',
      passwords: 'site/users/passwords'
    }
  end
end
