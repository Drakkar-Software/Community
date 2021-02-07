# frozen_string_literal: true

if Engines.exists? "Spree::Tentacles"
  Sidekiq::Cron::Job.create(name: 'Tentacle Populating Job', cron: '* * * * *', class: 'Spree::Tentacles::PopulateJob')
end
