require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module RoadzeRails
  class Application < Rails::Application

    config.load_defaults 6.0

    config.exceptions_app = self.routes

    if Rails.env.development? 
      config.action_mailer.delivery_method = :letter_opener
      config.action_mailer.perform_deliveries = true
      config.action_mailer.raise_delivery_errors = true
      config.action_mailer.default_url_options = { host: 'lvh.me', port: 3000 }
    elsif Rails.env.production?
      config.action_mailer.delivery_method = :postmark
      config.action_mailer.postmark_settings = { :api_token => Rails.application.credentials[Rails.env.to_sym][:postmark][:api_key] }
      config.action_mailer.raise_delivery_errors = true
      config.action_mailer.default_url_options = { host: 'roadze.io' }
    end
  end
end
