module Spree
  module Api
    module V2
      module Storefront
        module ProductsControllerDecorator
          def self.prepended(base)
            base.before_action :require_spree_current_user, only: [:create]
          end

          def create
            resource = model_class.new(create_params)
            resource.shipping_category = Spree::ShippingCategory.second # => digital, TODO improve it
            resource.taxons = [Spree::Taxon.find_by!(name: "Tentacle")] # TODO add a setting
            # TODO save author
            # TODO upload digital assets
            # TODO upload image
            ensure_current_store(resource)

            if resource.save
              render_serialized_payload(201) { serialize_resource(resource) }
            else
              render_error_payload(resource.errors)
            end
          end

          private

          def create_params
            params.require(:product).permit(:name, :price, :description)
          end
        end
      end
    end
  end
end

::Spree::Api::V2::Storefront::ProductsController.prepend Spree::Api::V2::Storefront::ProductsControllerDecorator
