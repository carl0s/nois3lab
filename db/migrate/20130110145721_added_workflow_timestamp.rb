class AddedWorkflowTimestamp < ActiveRecord::Migration
  def up
  	change_table :works do |t|
  		t.integer :updated_on
  	end
  end

  def down
  	remove_column :works, :updated_on
  end
end
