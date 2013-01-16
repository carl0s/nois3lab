class RemoveState < ActiveRecord::Migration
  def up
    remove_column :works, :state
    remove_column :works, :facebook
    remove_column :works, :twitter
    remove_column :works, :behance
    remove_column :works, :tumblr
    remove_column :works, :pinterest
    remove_column :media_assets, :cache_field, :string
    add_column :media_assets, :thumb_cache_field, :string
    add_column :media_assets, :image_cache_field, :string
  end

  def down
    add_column :works, :state
    add_column :works, :facebook
    add_column :works, :twitter
    add_column :works, :behance
    add_column :works, :tumblr
    add_column :works, :pinterest
    add_column :media_assets, :cache_field, :string
    remove_column :media_assets, :thumb_cache_field
    remove_column :media_assets, :image_cache_field
  end
end
