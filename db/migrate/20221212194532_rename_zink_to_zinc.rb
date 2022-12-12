class RenameZinkToZinc < ActiveRecord::Migration[7.0]
  def change
    rename_column :food_items, :zink, :zinc
  end
end
