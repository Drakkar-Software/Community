Rails.application.routes.draw do
  # This line mounts Spree's routes at the root of your application.
  # This means, any requests to URLs such as /products, will go to
  # Spree::ProductsController.
  # If you would like to change where this engine is mounted, simply change the
  # :at option to something different.
  #
  # We ask that you don't use the :as option here, as Spree relies on it being
  # the default of "spree".
  mount Spree::Core::Engine, at: '/'

  root to: redirect('/404') # redirect / instead of rails welcome

  # if Rails.env.production?
  #   Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  #     # Protect against timing attacks:
  #     # - See https://codahale.com/a-lesson-in-timing-attacks/
  #     # - See https://thisdata.com/blog/timing-attacks-against-string-comparison/
  #     # - Use & (do not use &&) so that it doesn't short circuit.
  #     # - Use digests to stop length information leaking (see also ActiveSupport::SecurityUtils.variable_size_secure_compare)
  #     ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(username), ::Digest::SHA256.hexdigest(ENV['SIDEKIQ_USERNAME'])) &
  #       ActiveSupport::SecurityUtils.secure_compare(::Digest::SHA256.hexdigest(password), ::Digest::SHA256.hexdigest(ENV['SIDEKIQ_PASSWORD']))
  #   end
  # end

  # sidekiq web UI
  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/admin/sidekiq'
end

Spree::Core::Engine.add_routes do
  namespace :api, defaults: { format: 'json' } do
    namespace :v2 do
      namespace :storefront do
        post '/products', to: 'products#create', as: :products_create
      end
    end
  end
end
