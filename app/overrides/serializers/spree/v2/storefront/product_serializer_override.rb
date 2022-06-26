Spree::V2::Storefront::ProductSerializer.class_eval do
  attribute :author_name do |object|
    object.author.email # TODO change to a real author name
  end
end
