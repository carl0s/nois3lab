class AddSlugToTables < ActiveRecord::Migration
  def change
    change_table :works do |t|
      t.string  :slug
    end
    add_index :works, :slug, unique: true

    change_table :clients do |t|
      t.string  :slug
    end
    add_index :clients, :slug, unique: true

    change_table :posts do |t|
      t.string  :slug
    end
    add_index :posts, :slug, unique: true

    change_table :services do |t|
      t.string  :slug
    end
    add_index :services, :slug, unique: true

    change_table :teammates do |t|
      t.string  :slug
    end
    add_index :teammates, :slug, unique: true

    change_table :users do |t|
      t.string  :slug
    end
    add_index :users, :slug, unique: true

    change_table :tags do |t|
      t.string  :slug
    end
    add_index :tags, :slug, unique: true

  end

  def down
    remove_column :works, :slug
    remove_column :clients, :slug
    remove_column :posts, :slug
    remove_column :services, :slug
    remove_column :teammates, :slug
    remove_column :users, :slug
  end
end
