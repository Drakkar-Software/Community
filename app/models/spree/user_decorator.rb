module Spree::UserDecorator
  def self.prepended(base)
    base.include Spree::WelcomePromotion

    base.after_create :trigger_welcome_promotions
  end
end
::Spree.user_class.prepend(Spree::UserDecorator)
