class AddBehance < ActiveRecord::Migration
  def up
    change_table :companies do |t|
      t.string :behance
    end
  end

  def down
    remove_column :behance
  end
end
