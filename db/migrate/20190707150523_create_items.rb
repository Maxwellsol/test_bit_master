class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :quality
      t.integer :sell_in
      t.boolean :legendary, default: false

      t.timestamps
    end
  end
end
