class MediaAssetUploader < ActiveRecord::Migration
  def up
    add_column :media_assets, :image, :string
  end

  def down
    remove_column :media_assets, :image
  end
end
