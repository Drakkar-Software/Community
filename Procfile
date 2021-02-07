release: bundle exec rails db:migrate
reset_database: bundle exec rake reseed_database
web: bundle exec puma -t 5:5 -p $PORT -e $RAILS_ENV
worker: bundle exec sidekiq -t 25 -c 3
