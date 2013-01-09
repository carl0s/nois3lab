class AddWorkflow < ActiveRecord::Migration
  def up
  	change_table :invoices do |t|
  		t.string :status
  	end
  end

  def down
  	remove_column :invoices, :status
  end
end
