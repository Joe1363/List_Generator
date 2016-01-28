class ChangeElementTypeName < ActiveRecord::Migration
  def change
    rename_column :elements, :type, :element_type
  end
end
