require_relative 'boot'
require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

require_relative 'i18n_js_renderer'

module Orion
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.react.addons = true
    config.react.server_renderer = React::ServerRendering::I18nJsRenderer
    config.i18n.default_locale = :fr
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
  end
end
