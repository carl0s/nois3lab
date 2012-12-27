class AddServiceIdTeammate < ActiveRecord::Migration
  def up
    change_table :teammates do |t|
      t.integer :service_id
    end
  end

  def down
    remove_column :teammates, :service_id
  end
end
