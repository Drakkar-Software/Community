# This migration comes from spree_cloud (originally 20211215152009)
class CreateSpreeHosts < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_hosts do |t|
      t.string :name

      t.timestamps
    end
  end
end
