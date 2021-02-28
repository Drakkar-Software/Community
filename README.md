# OctoBot-Community

## Installation

Install the rails project
```bash
bundle install
```
Prepare database
```bash
rails db:create
rails db:migrate
rails db:seed
```
Import dummy data
```bash
bundle exec spree_sample:load
```

## Run the website
```bash
rails s
```

## Run Sidekiq (for async tasks)
```bash
bundle exec sidekiq
```

## Update sitemap and notify search engines
```bash
bundle exec rake sitemap:refresh
```
