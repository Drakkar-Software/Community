module Spree
  class Subscription
    module Actions
      class Download < Spree::SubscriptionAction
        def init
          # TODO
          start
        end

        def start

        end

        def pause
          stop
        end

        def refresh

        end

        def resume
          start
        end

        def stop
          # TODO
        end
      end
    end
  end
end
