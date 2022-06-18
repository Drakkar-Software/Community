module Spree
  module WelcomePromotion
    extend ActiveSupport::Concern

    def trigger_welcome_promotions
      WelcomePromotion.welcome_promotion_category.promotions.each do |promotion|
        activate_promotion promotion
      end
    end

    def self.welcome_promotion_category
      Spree::PromotionCategory.find_or_create_by!(name: 'Welcome')
    end

    private

    def activate_promotion(promotion)
      promotion.activate({ order: Spree::Order.new, user: self, store: Spree::Store.default })
    end
  end
end
