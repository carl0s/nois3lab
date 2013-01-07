class RemoveTotals < ActiveRecord::Migration
  def up
    remove_column :items, :total
    remove_column :items, :total_price
  end

  def down
    change_table :items do |t|
      t.float :total
      t.float :total_price
    end
  end
end
