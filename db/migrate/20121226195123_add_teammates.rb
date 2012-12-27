class AddTeammates < ActiveRecord::Migration
  def up
    change_table :works do |t|
      t.integer :teammate_id
    end
  end

  def down
    remove_column :works, :teammate_id
  end
end
