class InvoiceNumber < ActiveRecord::Migration
  def up
    change_table :invoices do |t|
      t.string :invoice_n
    end
  end

  def down
    remove_column :invoices, :invoice_n
  end
end
