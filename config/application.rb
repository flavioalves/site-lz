require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'sprockets/railtie'

if defined?(Bundler)
  Bundler.require(*Rails.groups(:assets => %w(development test)))
end

module SiteLZ
  class Application < Rails::Application
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += [:password]

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true
    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.0'

    config.generators.stylesheet_engine = :sass
    config.assets.initialize_on_precompile = false

    #config.assets.paths << "#{Rails}/vendor/spacelab-theme"
    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :'pt-BR'
  end
end
