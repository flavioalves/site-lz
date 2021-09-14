
SiteLZ::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  config.assets.js_compressor = :uglifier

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  # config.serve_static_files = false
  config.static_cache_control = 'public, max-age=31536000'

  config.log_level = :info

  config.assets.compress = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server
  # config.action_controller.asset_host = "dluafhj7422d4.cloudfront.net"

  # Precompile additional assets (application.js, application.css, and all non-JS/CSS are already added)
  # config.assets.precompile += %w( search.js )
  config.assets.precompile += %w(
    html5shiv-printshiv.js
    selectivizr.js
    active_admin.js
    active_admin.css
    active_admin/print.css
    grid.js
  )

  # Do not eager load code on boot.
  config.eager_load = false

  Slim::Engine.set_default_options pretty: true
  Slim::Engine.set_default_options format: :html
  # Disable delivery errors, bad email addresses will be ignored
  # config.action_mailer.raise_delivery_errors = false

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # Log the query plan for queries taking more than this (works
  # with SQLite, MySQL, and PostgreSQL)
  config.action_mailer.default_url_options = { :host => ENV['APP_HOSTNAME'] }
end
