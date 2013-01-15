class Post < ActiveRecord::Base

  attr_accessible :content, :title, :tumblr_blog_name, :post_url, :type, :state, :short_url
  has_many :teammates


  extend FriendlyId
  friendly_id :title, :use => :slugged

<<<<<<< HEAD
  def tumblr
    tumblr = Tumblr::Client.new do |client|
      client.consumer_key = 'nqrv0EyDf9lnb7u6TrkPXQCf634FM1UtnYlLxgixrRS9rr5c86'
      client.consumer_secret = 'dR25RkyxEqBkZV4ryqvkPI9i458kfriCRb7TFLzXsqjq95fjBw'
      client.oauth_token = 'Rnr4sKbpr9X1B6vpC09p8FQVFbgi157KJakrYnckDMb3svap5y'
      client.oauth_token_secret = 'THgZScm3OeqHPJ0DpcRcVm9gTkRpRBrfGi5BPTgrXTIt0omp6u'
    end
    return tumblr
=======
  def client
    Tumblife.configure do |config|
      config.consumer_key = 'FJjyfZ8fhCeZGaepY3QEZX6AGxn7pv8XzT3O5LzFeKgO36EdJE'
      config.consumer_secret = 'Bp6pvY2T8XymtUc3YvdFw2yiwMXnXMRtc65W8umQOJXAFrvfHx'
      config.oauth_token = 'Qjm7BDHsA9gOzzAMbhzyUxkUXk7YOhvHSDHKBOAN79GjsPhzHl'
      config.oauth_token_secret = 'A9DnguZIorIFqLT6j9dMDGQsXaARECerf1K1wUaVNxKzPg4cjg'
    end

    return client = Tumblife.client
>>>>>>> 31db691a33046cfebe69fb24b6ebd2a15023b114
  end

end


