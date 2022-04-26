#! /bin/sh

if bundle exec rails db:exists ; then
  echo "Database already exists, migrating..."
  bundle exec rails db:migrate
else
  echo "Database doesn't exist, creating..."
  bundle exec rails db:setup
fi

echo "Database is ready!"
