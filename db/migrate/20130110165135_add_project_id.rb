class AddProjectId < ActiveRecord::Migration
  def up
  	change_table :works do |t|
  		t.string :project_id
  	end
  end

  def down
  	remove_column :works, :project_id
  end
end
