class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.text :content
      t.string :url

      t.timestamps
    end
  end
end
