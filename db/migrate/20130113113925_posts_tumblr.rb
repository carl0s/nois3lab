class PostsTumblr < ActiveRecord::Migration
  def up
    change_table :posts do |t|
      t.string :tumblr_blog_name
      t.string :post_url
      t.string :post_type
      t.string :state
      t.string :short_url
    end
  end

  def down
    remove_column :posts, :tumblr_blog_name
    remove_column :posts, :post_url
    remove_column :posts, :post_type
    remove_column :posts, :state
    remove_column :posts, :short_url
  end
end
