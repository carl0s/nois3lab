class TumblrFriendly < ActiveRecord::Migration
  def up
    add_column :posts, :integer, :tumblr_id
  end

  def down
    remove_column :posts, :integer, :tumblr_id
  end
end
