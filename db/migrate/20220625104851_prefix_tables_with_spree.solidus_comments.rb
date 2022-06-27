# frozen_string_literal: true
# This migration comes from solidus_comments (originally 20111123200847)

class PrefixTablesWithSpree < SolidusSupport::Migration[4.2]
  def change
    rename_table :comments, :spree_comments
    rename_table :comment_types, :spree_comment_types
  end
end
