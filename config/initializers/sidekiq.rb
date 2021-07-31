Sidekiq.configure_server do |_config|
  Sidekiq::Logging.logger.level = Logger::DEBUG
end
