module Spree::ProductDecorator
  def self.prepended(base)
    base.belongs_to :author, class_name: "Spree::User"
  end
end
::Spree::Product.prepend(Spree::ProductDecorator)
