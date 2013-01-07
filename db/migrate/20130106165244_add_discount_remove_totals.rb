class AddDiscountRemoveTotals < ActiveRecord::Migration
  def up
    remove_column :invoices, :subtotal
    remove_column :invoices, :grand_total
    change_table :invoices do |t|
      t.integer :discount_id
    end
  end

  def down
    remove_column :invoices, :discount_id
    change_table :invoices do |t|
      t.integer :subtotal
      t.integer :grand_total
    end

  end
end
