# frozen_string_literal: true

if defined?(Spree::Tentacles::PopulateJob) == 'constant'
  Sidekiq::Cron::Job.create(name: 'Tentacle Populating Job', cron: '* * * * *', class: 'Spree::Tentacles::PopulateJob')
end
