class ModelRelationship < ActiveRecord::Migration
  def up
    change_table :works do |t|
      t.integer :client_id
    end
    change_table :teammates do |t|
      t.integer :work_id
    end
    change_table :posts do |t|
      t.integer :teammate_id
    end
  end

  def down
    remove_column :works, :client_id
    remove_column :teammates, :work_id
    remove_column :posts, :teammate_id
  end
end
