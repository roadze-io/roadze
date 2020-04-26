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
    namespace :frontend, path: '' do
      match '/404', to: 'errors#not_found', via: :all
      match '/422', to: 'errors#unacceptable', via: :all
      match '/500', to: 'errors#internal_server_error', via: :all

      resource :account, controller: 'account', except: [:index]
    end
  end
  # admin.roadze.io || admin.roadze.com
  constraints(Support) do
    namespace :backend, path: '' do
      match '/404', to: 'errors#not_found', via: :all
      match '/422', to: 'errors#unacceptable', via: :all
      match '/500', to: 'errors#internal_server_error', via: :all

      resources :accounts, controller: 'accounts'
    end
  end
end
