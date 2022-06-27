# frozen_string_literal: true
# This migration comes from solidus_related_products (originally 20200402134239)

class AddBidirectionalToSpreeRelationType < SolidusSupport::Migration[5.2]
  def change
    add_column :spree_relation_types, :bidirectional, :boolean, default: false
  end
end
