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
            resource.price = params[:price].present? ? params[:price] : 0
            resource.author = spree_current_user
            resource.shipping_category = Spree::ShippingCategory.second # => digital, TODO improve it
            resource.taxons = [Spree::Taxon.find_by!(name: "Tentacle")] # TODO add a setting
            ensure_current_store(resource)

            # product images
            # TODO use real attachment
            if params[:images].present?
              resource.master.images = params[:images].map { |img| base64_to_file img }
            end

            # digital assets
            if params[:digitalAssets].present?
              resource.master.digitals = params[:digitalAssets].map { |asset| base64_to_file asset }
            end

            if resource.save
              render_serialized_payload(201) { serialize_resource(resource) }
            else
              render_error_payload(resource.errors)
            end
          end

          private

          def create_params
            params.require(:product).permit(:name, :description)
          end

          def base64_to_file(base64_data)
            return base64_data unless base64_data.is_a? String

            zip_regex = /data:application\/zip;base64,/
            img_regex = /data:image\/([a-z]{3,4});base64,/
            zip_regex_result = zip_regex.match(base64_data)
            img_regex_result = img_regex.match(base64_data)
            if base64_data
              if img_regex_result
                start = img_regex_result.to_s
                image_type = base64_data.scan(img_regex)[0][0]
                image = Spree::Image.new
                image.attachment.attach(
                  io: StringIO.new(Base64.decode64(base64_data[start.length..-1])),
                  filename: "#{SecureRandom.hex}.#{image_type}",
                  content_type: "image/#{image_type}")
                image
              elsif zip_regex_result
                start = img_regex_result.to_s
                digital = Spree::Digital.new
                digital.attachment.attach(
                  io: StringIO.new(Base64.decode64(base64_data[start.length..-1])),
                  filename: "#{SecureRandom.hex}.zip",
                  content_type: "application/zip")
                digital
              else
                nil
              end
            else
              nil
            end
          end
        end
      end
    end
  end
end

::Spree::Api::V2::Storefront::ProductsController.prepend Spree::Api::V2::Storefront::ProductsControllerDecorator
