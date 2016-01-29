class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :element_id
      t.integer :order_number
      t.string :list_type
      t.string :content

      t.timestamps null: false
    end

    add_foreign_key :list_items, :elements
  end
end
