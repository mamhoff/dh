# frozen_string_literal: true
# This migration comes from alchemy (originally 20220514072456)

class RestrictOnDeletePageIdForeignKeyFromAlchemyNodes < ActiveRecord::Migration[6.0]
  def up
    remove_foreign_key :alchemy_nodes, :alchemy_pages
    add_foreign_key :alchemy_nodes, :alchemy_pages, column: :page_id, on_delete: :restrict
  end

  def down
    remove_foreign_key :alchemy_nodes, :alchemy_pages
    add_foreign_key :alchemy_nodes, :alchemy_pages, column: :page_id, on_delete: :cascade
  end
end
