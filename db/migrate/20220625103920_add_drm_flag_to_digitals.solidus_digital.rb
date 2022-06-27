# frozen_string_literal: true
# This migration comes from solidus_digital (originally 20170308121840)

class AddDrmFlagToDigitals < ActiveRecord::Migration[4.2]
  def change
    add_column :spree_digitals, :drm, :boolean, default: false, null: false
  end
end
