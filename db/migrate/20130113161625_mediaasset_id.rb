class MediaassetId < ActiveRecord::Migration
  def up
    change_table :media_assets do |t|
      t.integer :work_id
      t.integer :teammate_id
      t.integer :client_id
      t.integer :service_id
      t.integer :tag_id
      t.string  :behance_src
      t.text    :behance_embed
    end
  end

  def down
    remove_column :media_assets, :work_id
    remove_column :media_assets, :teammate_id
    remove_column :media_assets, :client_id
    remove_column :media_assets, :service_id
    remove_column :media_assets, :tag_id
    remove_column :media_assets, :behance_src
    remove_column :media_assets, :behance_embed

    remove_column :works, :project_id
  end
end
