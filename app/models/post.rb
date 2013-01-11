class Post < ActiveRecord::Base

  attr_accessible :content, :title
  has_many :teammates

  validates :title, :presence => true

  extend FriendlyId
  friendly_id :title, :use => :slugged

  def client
    Tumblife.configure do |config|
      config.consumer_key = 'FJjyfZ8fhCeZGaepY3QEZX6AGxn7pv8XzT3O5LzFeKgO36EdJE'
      config.consumer_secret = 'Bp6pvY2T8XymtUc3YvdFw2yiwMXnXMRtc65W8umQOJXAFrvfHx'
      config.oauth_token = 'Qjm7BDHsA9gOzzAMbhzyUxkUXk7YOhvHSDHKBOAN79GjsPhzHl'
      config.oauth_token_secret = 'A9DnguZIorIFqLT6j9dMDGQsXaARECerf1K1wUaVNxKzPg4cjg'
    end

    return client = Tumblife.client
  end

end
