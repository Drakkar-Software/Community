module Spree::UserDecorator
  def self.prepended(base)
    base.include Spree::WelcomePromotion

    base.after_create :trigger_welcome_promotions

    base.has_many :authored_products, foreign_key: 'author_id', inverse_of: :author, class_name: 'Spree::Product'
  end
end
::Spree.user_class.prepend(Spree::UserDecorator)
