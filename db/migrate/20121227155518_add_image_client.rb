class AddImageClient < ActiveRecord::Migration
  def up
    change_table :clients do |t|
      t.integer  :media_id
    end
    change_table :teammates do |t|
      t.integer  :media_id
    end
  end

  def down
    remove_column :teammates, :media_id
    remove_column :clients, :media_id
  end
end
