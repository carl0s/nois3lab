class Add < ActiveRecord::Migration
  def up
    change_table :invoices do |t|
      t.float :subtotal
      t.integer :tax_id
      t.float :grand_total
    end
  end

  def down
    remove_column :invoices, :subtotal
    remove_column :invoices, :tax_id
    remove_column :invoices, :grand_total
  end
end
