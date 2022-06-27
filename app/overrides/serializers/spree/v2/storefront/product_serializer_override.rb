Spree::V2::Storefront::ProductSerializer.class_eval do
  attribute :author_name do |object|
    if object.author.present?
      object.author.email # TODO change to a real author name
    else
      nil
    end
  end
end
