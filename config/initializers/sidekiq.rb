Sidekiq.configure_server do |_config|
  Sidekiq.logger.level = Logger::Severity::DEBUG
end
