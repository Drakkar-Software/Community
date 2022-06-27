module Spree::ProductDecorator
  def self.prepended(base)
    base.belongs_to :author, class_name: 'Spree::User'

    base.class_attribute :authored_products do |object|
      object.authored_products.pluck(:slug)
    end
  end

  ::Spree::Product.prepend self
end
