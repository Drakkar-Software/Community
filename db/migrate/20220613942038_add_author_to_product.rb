class AddAuthorToProduct < ActiveRecord::Migration[6.1]
  def change
    add_reference :spree_products, :author, index: true, foreign_key: {to_table: :spree_users}
  end
end
