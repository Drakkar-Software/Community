# This migration comes from spree (originally 20210514204251)
class CreateSpreeCmsSections < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_cms_sections do |t|
      t.column :name, :string, null: false
      t.column :content, :text
      t.column :settings, :text
      t.column :fit, :string
      t.column :destination, :string
      t.column :type, :string
      t.column :position, :integer

      t.references :linked_resource, polymorphic: true, index: { name: 'index_spree_cms_sections_on_linked_resource' }

      t.belongs_to :cms_page

      t.timestamps
    end

    add_index :spree_cms_sections, :type
    add_index :spree_cms_sections, :position
  end
end
