# This migration comes from spree_tentacles (originally 20201130208001)
class CreateSpreeTentacles < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_tentacles do |t|
      t.string :name

      t.timestamps
    end
  end
end
