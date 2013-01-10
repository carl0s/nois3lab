class Added < ActiveRecord::Migration
  def up
  	change_table :works do |t|
  		t.string :status
  	end
  end

  def down
  	remove_column :works, :status
  end
end
