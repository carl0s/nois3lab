class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :name
      t.text :description
      t.integer :doc_id
      t.integer :client_id

      t.timestamps
    end
  end
end
