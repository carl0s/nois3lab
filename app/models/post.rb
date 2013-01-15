class Post < ActiveRecord::Base

  attr_accessible :content, :title, :tumblr_blog_name, :post_url, :type, :state, :short_url
  has_many :teammates


  extend FriendlyId
  friendly_id :title, :use => :slugged

  def tumblr
    tumblr = Tumblr::Client.new do |client|
      client.consumer_key = 'nqrv0EyDf9lnb7u6TrkPXQCf634FM1UtnYlLxgixrRS9rr5c86'
      client.consumer_secret = 'dR25RkyxEqBkZV4ryqvkPI9i458kfriCRb7TFLzXsqjq95fjBw'
      client.oauth_token = 'Rnr4sKbpr9X1B6vpC09p8FQVFbgi157KJakrYnckDMb3svap5y'
      client.oauth_token_secret = 'THgZScm3OeqHPJ0DpcRcVm9gTkRpRBrfGi5BPTgrXTIt0omp6u'
    end
    return tumblr
  end

end


