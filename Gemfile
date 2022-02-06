source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# petty print
gem 'awesome_print'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false
# caching
gem 'dalli' # memcache
gem 'rack-cache' # http caching
# Rack CORS Middleware
gem 'rack-cors'
# improved JSON rendering performance
gem 'oj'

# database
gem 'activerecord-nulldb-adapter'

# bundler
gem 'bundler', '~>2.2.33'

# View overrides
gem 'deface'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # linter
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'pry-byebug'
  gem 'bundler-audit'
  gem 'brakeman'

  # required to listen to file changes in rails 6.1+
  gem 'listen'

  # monitoring
  gem 'bullet'
  gem 'rack-mini-profiler', require: false
  gem 'flamegraph'
  gem 'stackprof'
  gem 'memory_profiler'
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

# Spree
spree_opts = '>= 4.4.0rc1'
gem 'spree', spree_opts
gem 'spree_emails', spree_opts
gem 'spree_backend', spree_opts
gem 'spree_gateway'
gem 'spree_auth_devise'
gem 'spree_i18n', '>= 5.0'

gem 'spree_sitemap', github: 'spree-contrib/spree_sitemap'
# gem 'spree_related_products', github: 'spree-contrib/spree_related_products'
# gem 'spree_reviews', github: 'spree-contrib/spree_reviews'
# gem 'spree_product_assembly', github: 'spree-contrib/spree-product-assembly'

# aws services
gem 'aws-sdk-s3'
gem 'aws-sdk-elasticbeanstalk'
gem 'aws-sdk-lambda'
gem 'aws-sdk-route53'

# jobs
gem 'sidekiq'
gem 'sidekiq-scheduler', '~> 3.1.0'

# cryptocurrencies price
gem 'binance-ruby', github: 'Drakkar-Software/binance-ruby', branch: 'rails6.0'
