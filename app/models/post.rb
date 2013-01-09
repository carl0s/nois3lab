class Post < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :teammates

  validates :name, :presence => true

  extend FriendlyId
  friendly_id :name, :use => :slugged

  def tumblr
    Tumblr.configure do |config|
        config.consumer_key = "nqrv0EyDf9lnb7u6TrkPXQCf634FM1UtnYlLxgixrRS9rr5c86"
        config.consumer_secret = " dR25RkyxEqBkZV4ryqvkPI9i458kfriCRb7TFLzXsqjq95fjBw"
        config.oauth_token = "access_token"
        config.oauth_token_secret = "access_token_secret"
    end
    Tumblr.new
    Tumblr.new.posts("nois3labn3.tumblr.com")

  end

end
