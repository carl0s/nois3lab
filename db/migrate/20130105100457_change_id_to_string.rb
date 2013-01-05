class ChangeIdToString < ActiveRecord::Migration
  def up
    remove_column :items, :invoice_id
    change_table :items do |t|
      t.string :invoice_id
    end
  end

  def down
  end
end
