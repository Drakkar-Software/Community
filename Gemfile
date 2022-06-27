source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sprockets', '~> 3'
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
gem 'bundler', '~>2.1'

# View overrides
gem 'deface'

group :development do
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

# solidus
gem 'solidus', '~> 3.1'

# solidus i18n
gem 'solidus_i18n', github: 'solidusio/solidus_i18n'
gem 'rails-i18n'
gem 'kaminari-i18n'

# solidus extensions
gem 'solidus_auth_devise'
gem 'solidus_stripe'
gem "solidus_comments", github: 'solidusio-contrib/solidus_comments'
gem 'solidus_subscriptions', github: 'solidusio-contrib/solidus_subscriptions'
gem 'solidus_sitemap', github: 'solidusio-contrib/solidus_sitemap'
gem 'solidus_print_invoice' , github: 'solidusio-contrib/solidus_print_invoice'
gem 'solidus_digital', github: 'solidusio-contrib/solidus_digital'
gem 'solidus_reviews', github: 'solidusio-contrib/solidus_reviews'
gem 'solidus_wishlist', github: 'boomerdigital/solidus_wishlist'
gem 'solidus_related_products', github: 'solidusio-contrib/solidus_related_products'

# Drakkar Software's engines
# gem 'spree_donations', github: 'Drakkar-Software/spree_donations', branch: 'master'
# gem 'spree_cloud', github: 'Drakkar-Software/spree_cloud', branch: 'master'
# gem 'spree_feeds', github: 'Drakkar-Software/spree_feeds', branch: 'master'

# jobs
gem 'sidekiq'
gem 'sidekiq-scheduler', '~> 3.2.2'
