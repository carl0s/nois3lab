class AddMediaAssetId < ActiveRecord::Migration
  def up
    change_table :works do |t|
      t.integer :media_id
    end
  end

  def down
    remove_column :works, :media_id
  end
end
