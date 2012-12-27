class TeammatesField < ActiveRecord::Migration
  def up
    change_table :teammates do |t|
      t.boolean :is_public
      t.string  :job_position_id
      t.integer :post_id
      t.integer :year
    end

  end

  def down
    remove_column :teammates, :is_public
    remove_column :teammates, :job_position_id
    remove_column :teammates, :post_id
    remove_column :teammates, :year
  end
end
