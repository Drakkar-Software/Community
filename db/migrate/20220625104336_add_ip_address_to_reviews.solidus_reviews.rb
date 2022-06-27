# frozen_string_literal: true
# This migration comes from solidus_reviews (originally 20110806093221)

class AddIpAddressToReviews < SolidusSupport::Migration[4.2]
  def self.up
    add_column :reviews, :ip_address, :string
  end

  def self.down
    remove_column :reviews, :ip_address
  end
end
