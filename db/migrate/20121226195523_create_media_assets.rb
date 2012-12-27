class CreateMediaAssets < ActiveRecord::Migration
  def change
    create_table :media_assets do |t|
      t.string :name

      t.timestamps
    end
  end
end
