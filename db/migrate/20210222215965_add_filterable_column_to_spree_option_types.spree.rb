# This migration comes from spree (originally 20201012091259)
class AddFilterableColumnToSpreeOptionTypes < ActiveRecord::Migration[6.0]
  def change
    unless column_exists?(:spree_option_types, :filterable)
      add_column :spree_option_types, :filterable, :boolean, default: true, null: false
    end
    unless index_exists?(:spree_option_types, :filterable)
      add_index :spree_option_types, :filterable
    end
  end
end
