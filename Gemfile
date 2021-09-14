source 'https://rubygems.org'
ruby '2.4.7'

gem 'rails', '~> 4.2.5'
gem 'pg', '~> 0.15'
gem 'slim'
gem 'unicorn'
gem 'devise'

gem 'activeadmin'
gem 'acts_as_list'
gem 'activeadmin-sortable'

gem "mini_magick"
gem "refile", require: "refile/rails"
gem "refile-mini_magick"
gem "refile-s3"
gem "aws-sdk"
gem "cancan"

gem 'friendly_id'
gem 'resque'

# external services
gem 'newrelic_rpm'
gem 'sentry-raven'

# gems to help in rails 4 transition
gem 'protected_attributes'
gem 'rails-observers'

# assets
gem 'sass'
gem 'sass-rails'
gem 'uglifier',       '>= 1.3.0'
gem 'font_assets'
gem 'font-awesome-rails'
gem 'modernizr-rails'
gem 'selectivizr-rails'
gem 'singularitygs'
gem 'singularity-extras'

gem 'oily_png'
# gem 'color-schemer'
gem 'toolkit'

gem "paperclip"

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'timecop'
  gem 'email_spec'
end

group :development do
  gem 'foreman'
  gem 'thin'
  gem 'rails-boilerplate'
  gem 'magic_encoding'
  gem 'html2slim'
  gem 'guard-livereload', require: false
  gem 'rack-livereload'
  gem 'rb-fsevent', require: false
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'rack-mini-profiler'
end

group :production do
  gem 'heroku-deflater'
  gem 'rails_12factor'
end

