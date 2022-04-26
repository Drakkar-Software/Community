module Spree
  class SubscriptionJob
    include Sidekiq::Worker
    sidekiq_options retry: 1

    def perform
      @errors = []

      Spree::User.all.each do |user|
        # hosting
        @errors << trigger_user_subscriptions(user)

        # copying
        # TODO
      end

      if @errors.empty?
        Sidekiq.logger.info('Job done.')
      else
        raise "Error when updating subscriptions : \n#{@errors.join("\n")}"
      end
    end

    private

    def trigger_user_subscriptions(user)
      @errors = []
      if defined?(Spree::Hosting)
        Sidekiq.logger.info("Hosting subscription for #{user}")
        begin
          Spree::Hosting::HostingSubscription.new.trigger_user_subscription(user)
        rescue StandardError => e
          @errors << "Error happened when paying hosting product : #{e}"
          logger.error e.backtrace.join("\n")
        end
      end
      @errors
    end
  end
end
