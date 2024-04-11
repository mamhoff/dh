# This migration comes from alchemy (originally 20231113104432)
class CreatePageMutexes < ActiveRecord::Migration[6.1]
  def change
    unless table_exists?(:alchemy_page_mutexes)
      create_table :alchemy_page_mutexes do |t|
        t.references :page, null: false, type: "int(11)", index: {unique: true}, foreign_key: {to_table: :alchemy_pages}
        t.datetime :created_at
      end
    end
  end
end
