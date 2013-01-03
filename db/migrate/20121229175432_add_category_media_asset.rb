class AddCategoryMediaAsset < ActiveRecord::Migration
  def up
    change_table :media_assets do |t|
      t.integer :category
    end
  end

  def down
    remove_column :media_assets, :category
  end
end
