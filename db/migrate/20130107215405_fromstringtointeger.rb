class Fromstringtointeger < ActiveRecord::Migration
  def up
    remove_column :invoices, :invoice_id
    remove_column :items, :invoice_id
    change_table :invoices do |t|
      t.integer :invoice_id
    end

    change_table :items do |t|
      t.integer :invoice_id
    end
  end

  def down
    remove_column :invoices, :invoice_id
    remove_column :items, :invoice_id

    change_table :invoices do |t|
      t.string :invoice_id
    end

    change_table :items do |t|
      t.string :invoice_id
    end

  end
end
