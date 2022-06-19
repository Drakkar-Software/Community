Spree::V2::Storefront::UserSerializer.class_eval do
  attribute :authored_products do |object|
    object.authored_products.pluck(:slug)
  end
end
