#!/bin/sh

bundle exec rake db:prepare && echo "Database is ready!"
bundle exec rails s -b 0.0.0.0 -p 4000
