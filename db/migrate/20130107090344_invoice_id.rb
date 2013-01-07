class InvoiceId < ActiveRecord::Migration
  def up
    change_table :invoices do |t|
      t.string :invoice_id
    end
  end

  def down
    remove_column :invoices, :invoice_id
  end
end
