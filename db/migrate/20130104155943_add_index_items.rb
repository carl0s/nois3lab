class AddIndexItems < ActiveRecord::Migration
  def up
    add_index :items, :invoice_id
  end

  def down
    remove_index :items, :invoice_id
  end
end
