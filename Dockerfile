FROM ruby:2.6.7-alpine as Builder

ARG GITHUB_TOKEN

# Add basic packages
RUN apk add --no-cache \
      build-base \
      postgresql-dev \
      git \
      nodejs \
      yarn \
      tzdata \
      file

WORKDIR /app

# Install standard Node modules
COPY package.json yarn.lock /app/
RUN yarn install --frozen-lockfile

# Install standard gems
COPY Gemfile* /app/
RUN gem install bundler -v "~>2.0.2" && \
    bundle config --local GITHUB__COM x-oauth-basic:$GITHUB_TOKEN && \
    bundle config --local frozen 1 && \
    bundle config --local build.sassc --disable-march-tune-native && \
    bundle install -j4 --retry 3

#### ONBUILD: Add triggers to the image, executed later while building a child image

# Install Ruby gems (for production only)
COPY Gemfile* /app/
RUN bundle config --local without 'development test' && \
    bundle install -j4 --retry 3 && \
    # Remove unneeded gems
    bundle clean --force && \
    # Remove unneeded files from installed gems (cached *.gem, *.o, *.c)
    rm -rf /usr/local/bundle/cache/*.gem && \
    find /usr/local/bundle/gems/ -name "*.c" -delete && \
    find /usr/local/bundle/gems/ -name "*.o" -delete

# Copy the whole application folder into the image
COPY . /app

# Compile assets with Webpacker or Sprockets
#
# Notes:
#   1. Executing "assets:precompile" runs "yarn:install" prior
#   2. Executing "assets:precompile" runs "webpacker:compile", too
#   3. For an app using encrypted credentials, Rails raises a `MissingKeyError`
#      if the master key is missing. Because on CI there is no master key,
#      we hide the credentials while compiling assets (by renaming them before and after)
#
RUN mv config/credentials.yml.enc config/credentials.yml.enc.bak 2>/dev/null || true
RUN RAILS_ENV=production \
            DB_ADAPTER=nulldb \
            SECRET_KEY_BASE=dummy \
            RAILS_MASTER_KEY=dummy \
            bundle exec rails assets:precompile
RUN mv config/credentials.yml.enc.bak config/credentials.yml.enc 2>/dev/null || true

# Remove folders not needed in resulting image
RUN rm -rf node_modules tmp/cache vendor/bundle test spec

FROM ruby:2.6.6-alpine

# Add basic packages
RUN apk add --no-cache \
      postgresql-client \
      tzdata \
      file \
      imagemagick \
      nodejs

# Configure Rails
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_SERVE_STATIC_FILES true

WORKDIR /app

# Expose Puma port
EXPOSE 3000

# This image is for production env only
ENV RAILS_ENV production

# Add user and create tmp/pids folders to fix puma missing pid folder
RUN addgroup -g 1000 -S app \
    && adduser -u 1000 -S app -G app

# Copy app with gems from former build stage
COPY --from=Builder --chown=app:app /usr/local/bundle/ /usr/local/bundle/
COPY --from=Builder --chown=app:app /app /app

USER app

RUN mkdir -p tmp/pids

# Start up
CMD ["docker/startup.sh"]
