class RemoveColumnLegendaryFromItem < ActiveRecord::Migration[5.0]
  def up
    remove_column :items, :legendary
  end
  def down
    add_column :items, :legendary, :boolean, default: false
  end
end
