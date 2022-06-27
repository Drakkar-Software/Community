# frozen_string_literal: true
# This migration comes from solidus_digital (originally 20111207121840)

class RenameDigitalToNamespace < ActiveRecord::Migration[4.2]
  def change
    rename_table :digitals, :spree_digitals
    rename_table :digital_links, :spree_digital_links
  end
end
