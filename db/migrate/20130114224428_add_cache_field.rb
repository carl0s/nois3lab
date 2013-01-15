class AddCacheField < ActiveRecord::Migration
  def up
    change_table :media_assets do |t|
      t.string :cache_field
    end
  end

  def down
    remove_column :media_assets, :cache_field
  end
end
