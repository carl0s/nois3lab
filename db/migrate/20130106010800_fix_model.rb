class FixModel < ActiveRecord::Migration
  def up
    remove_column :invoices, :invoice_n
    change_table :invoices do |t|
      t.integer :year
    end
  end

  def down
    remove_column :invoices, :year
    change_table :invoices do |t|
      t.string :invoice_n
    end
  end
end
