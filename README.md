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

Install JS dependencies
```bash
yarn install
yarn build
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

## Create a new admin
```bash
rake spree_auth:admin:create
```
Can use `ADMIN_PASSWORD` and `ADMIN_EMAIL` env variables
