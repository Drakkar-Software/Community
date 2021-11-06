# This migration comes from spree_user_data (originally 20211005210121)
class CreateSpreeUserConfigurations < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_user_configurations do |t|
      t.belongs_to :user
      t.string :name
      t.timestamps
    end
  end
end
