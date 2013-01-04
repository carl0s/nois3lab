class AddQtyPriceItem < ActiveRecord::Migration
  def up
    change_table :items do |t|
      t.integer :quantity
      t.float   :unit_price
      t.integer :discount
      t.float   :total_price
    end
  end

  def down
    remove_column :items, :quantity
    remove_column :items, :unit_price
    remove_column :items, :discount
    remove_column :items, :total_price
  end
end
