module Spree
  module WelcomePromotion
    extend ActiveSupport::Concern

    WELCOME_PROMOTION_CATEGORY_NAME = "Welcome"

    def trigger_welcome_promotions
      Spree::PromotionCategory.find_by!(name: WELCOME_PROMOTION_CATEGORY_NAME).promotions.each do |promotion|
        activate_promotion promotion
      end
    end

    private

    def activate_promotion(promotion)
      promotion.activate({order: Spree::Order.new, user: self, store: Spree::Store.default})
    end
  end
end
