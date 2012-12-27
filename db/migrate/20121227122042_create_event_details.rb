class CreateEventDetails < ActiveRecord::Migration
  def change
    create_table :event_details do |t|
      t.string :name
      t.text :content
      t.integer :participants_n

      t.timestamps
    end
  end
end
