class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements do |t|
      t.integer :list_id
      t.integer :order_number
      t.string :type
      t.string :content

      t.timestamps null: false
    end

    add_foreign_key :elements, :lists
  end
end
