class CompaniesSocial < ActiveRecord::Migration
  def up
    change_table :works do |t|
      t.string :facebook
      t.string :twitter
      t.string :behance
      t.string :tumblr
      t.string :pinterest
    end
  end

  def down
    remove_column :works, :facebook
    remove_column :works, :twitter
    remove_column :works, :behance
    remove_column :works, :tumblr
    remove_column :works, :pinterest
  end
end
