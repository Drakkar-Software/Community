module Spree::ProductDecorator
  def self.prepended(base)
    base.belongs_to :author, class_name: 'Spree::User'
  end

  def set_unlimited_stock
    Spree::StockItem.create!(
      stock_location: Spree::StockLocation.first,  # default
      variant: self.master,
      backorderable: true
    )
  end

  def force_digital
    self.shipping_category = Spree::ShippingCategory.second # => digital
  end
end
::Spree::Product.prepend(Spree::ProductDecorator)
