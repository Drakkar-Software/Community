#! /bin/sh

./docker/wait-for-services.sh
./docker/prepare-db.sh

# bundle exec puma -C config/puma.rb TODO should run this command
bundle exec rails s -b 0.0.0.0 # TODO remove this one
