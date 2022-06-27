# frozen_string_literal: true
# This migration comes from solidus_related_products (originally 20190507095755)

class AddAppliesFromToSpreeRelationType < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_relation_types, :applies_from, :string

    reversible do |change|
      change.up do
        Spree::RelationType.update_all(applies_from: 'Spree::Product')
      end
    end
  end
end
