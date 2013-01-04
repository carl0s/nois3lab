class AddTotalInvoice < ActiveRecord::Migration
  def up
    change_table :items do |t|
      t.float :total
    end
  end

  def down
    remove_column :items, :total
  end
end
