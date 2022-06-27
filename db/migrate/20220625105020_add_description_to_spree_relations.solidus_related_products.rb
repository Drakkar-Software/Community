# frozen_string_literal: true
# This migration comes from solidus_related_products (originally 20190513101010)

class AddDescriptionToSpreeRelations < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_relations, :description, :string
  end
end
