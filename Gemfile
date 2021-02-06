source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# bundler
gem 'bundler', '~>2.0.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # linter
  gem 'rubocop', '~> 1.8.1'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'pry-byebug'
  gem 'bundler-audit'
  gem 'brakeman'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  gem 'faker'
  gem 'simplecov'
  gem 'database_cleaner'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-rails'
  gem 'webmock'
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'binance-ruby', github: 'Drakkar-Software/binance-ruby', branch: 'rails6.0'
gem 'plotly-rails-js', github: 'Drakkar-Software/plotly-rails-js', branch: 'finance'

# Spree
gem 'spree', github: 'Drakkar-Software/spree', branch: 'spree4'
gem 'spree_auth_devise', github: 'Drakkar-Software/spree_auth_devise', branch: 'spree4'
gem 'spree_gateway', github: 'Drakkar-Software/spree_gateway', branch: 'spree4'
gem 'spree_digital', github: 'Drakkar-Software/spree_digital', branch: 'spree4'
gem 'spree_related_products', github: 'Drakkar-Software/spree_related_products', branch: 'spree4'
gem 'spree_reviews', github: 'Drakkar-Software/spree_reviews', branch: 'spree4'

# database
gem 'database_cleaner'
gem 'activerecord-nulldb-adapter'

gem 'aws-sdk-s3'

# Keep 5.X versions to ensure compatibility with heroku free redis database
# On heroku: "You are connecting to Redis v3.2.12, Sidekiq requires Redis v4.0.0 or greater"
gem 'sidekiq', '~> 5.2'
gem "sidekiq-cron", "~> 1.1"
