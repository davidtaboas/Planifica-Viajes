require File.expand_path('../boot', __FILE__)

require 'rails/all'

require 'carrierwave'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PlanificaViajes
  class Application < Rails::Application

    # rutas para errores
    config.exceptions_app = self.routes

    # varios idiomas (I18n)
    config.middleware.use SimplesIdeias::I18n::Middleware
    config.i18n.default_locale = :es
  end
end
