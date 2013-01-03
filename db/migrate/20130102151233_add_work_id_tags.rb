class AddWorkIdTags < ActiveRecord::Migration
  def up
    change_table :tags do |t|
      t.integer  :work_id
    end

  end

  def down
    remove_column :tags, :work_id
  end
end
