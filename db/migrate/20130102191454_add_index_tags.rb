class AddIndexTags < ActiveRecord::Migration
  def up
    add_index :tags, :work_id

  end

  def down
    remove_index :tags, :work_id
  end
end
