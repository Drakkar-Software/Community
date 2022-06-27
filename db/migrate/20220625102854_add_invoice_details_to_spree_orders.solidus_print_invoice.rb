# frozen_string_literal: true
# This migration comes from solidus_print_invoice (originally 20140123094547)

class AddInvoiceDetailsToSpreeOrders < SolidusSupport::Migration[4.2]
  def change
    add_column :spree_orders, :invoice_number, :integer
    add_column :spree_orders, :invoice_date, :date
  end
end
