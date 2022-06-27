# frozen_string_literal: true
# This migration comes from solidus_related_products (originally 20130727004612)

class AddPositionToSpreeRelations < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_relations, :position, :integer
  end
end
