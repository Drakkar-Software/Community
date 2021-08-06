module Community::Spree::BaseControllerDecorator
  include Community::Spree::MetadataHelper
end

::Spree::BaseController.prepend(Community::Spree::BaseControllerDecorator)
