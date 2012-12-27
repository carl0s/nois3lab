class AddServiceId < ActiveRecord::Migration
  def up
    change_table :works do |t|
      t.integer :service_id
    end
  end

  def down
    remove_column :works, :service_id
  end
end
