class Marketing
  def self.matches?(request)
    request.subdomain.blank? || request.subdomain == 'www'
  end
end

class Subscription
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == 'app'
  end
end

class Support
  def self.matches?(request)
    request.subdomain.present? && request.subdomain == 'admin'
  end
end

Rails.application.routes.draw do
  # roadze.io || www.roadze.com
  constraints(Marketing) do
    root 'marketing#home'
    get 'features', to: 'marketing#features'
    get 'contact', to: 'marketing#contact'
    get 'pricing', to: 'marketing#pricing'

    match '/404', to: 'errors#not_found', via: :all
    match '/422', to: 'errors#unacceptable', via: :all
    match '/500', to: 'errors#internal_server_error', via: :all
  end

  # app.roadze.io || app.roadze.com
  constraints(Subscription) do
    devise_for :users, path: '',
                       path_names: {
                         sign_in: 'login',
                         sign_out: 'logout'
                       },
                controllers: {
                confirmations: 'users/confirmations',
                passwords: 'users/confirmations',
                sessions: 'users/sessions'
               }
    devise_scope :user do
      authenticated :user do
        root to: 'frontend/user_dashboard#index', as: :authenticated_user
      end
      unauthenticated do
        root to: 'users/sessions#new', as: :unauthenticated_user
      end
    end
    namespace :frontend, path: '' do
      match '/404', to: 'errors#not_found', via: :all
      match '/422', to: 'errors#unacceptable', via: :all
      match '/500', to: 'errors#internal_server_error', via: :all

      resources :accounts, controller: 'accounts', except: [:index]
    end
  end

  # admin.roadze.io || admin.roadze.com
  constraints(Support) do
    devise_for :admins, path: '',
                        path_names: {
                          sign_in: 'login',
                          sign_out: 'logout'
                        },
                        controllers: {
                          confirmations: 'admins/confirmations',
                          passwords: 'admins/passwords',
                          sessions: 'admins/sessions'
                        }
    devise_scope :admin do
      authenticated :admin do
        root to: 'backend/admin_dashboard#index', as: :authenticated_admin
      end
      unauthenticated do
        root to: 'admins/sessions#new', as: :unauthenticated_admin
      end
    end
    namespace :backend, path: '' do
      match '/404', to: 'errors#not_found', via: :all
      match '/422', to: 'errors#unacceptable', via: :all
      match '/500', to: 'errors#internal_server_error', via: :all

      resources :accounts, controller: 'accounts'
    end
  end
end
