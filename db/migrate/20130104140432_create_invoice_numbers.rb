class CreateInvoiceNumbers < ActiveRecord::Migration
  def change
    create_table :invoice_numbers do |t|
      t.integer :year
      t.integer :number
      t.timestamps
    end
  end
end
