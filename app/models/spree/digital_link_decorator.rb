module Spree::DigitalLinkDecorator
  def authorizable?
    !(expired? || access_limit_exceeded?) && subscribed?
  end

  private

  def subscribed?
    false
  end

  ::Spree::DigitalLink.prepend self
end
