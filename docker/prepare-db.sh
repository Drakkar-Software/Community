#! /bin/sh
bundle exec rake db:prepare && echo "prepare ok"
#if bundle exec rails db:exists ; then
#  echo "Database already exists, migrating..."
#  bundle exec rails db:migrate
#else
#  echo "Database doesn't exist, creating..."
#  bundle exec rake db:create
#  echo "Database migrate..."
#  bundle exec rake db:migrate
#  echo "Database seed..."
#  bundle exec rake db:seed
#fi

echo "Database is ready!"
