class WorksField < ActiveRecord::Migration
  def up
    change_table :works do |t|
      t.boolean :is_public
      t.boolean :is_recap
      t.boolean :is_event
      t.integer :event_id
      t.integer :cover_image
      t.integer :year
    end

  end

  def down
    remove_column :works, :is_public
    remove_column :works, :is_recap
    remove_column :works, :is_event
    remove_column :works, :event_id
    remove_column :works, :cover_image
    remove_column :works, :year
  end
end
