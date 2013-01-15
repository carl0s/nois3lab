class WorksWorkflow < ActiveRecord::Migration
  def up
    change_table :works do |t|
      t.string :state
    end
  end

  def down
    remove_column :works, :state
  end
end
