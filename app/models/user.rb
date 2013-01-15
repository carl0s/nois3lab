class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :authentications, :dependent => :delete_all

  extend FriendlyId
  friendly_id :name, :use => :slugged
  require 'oauth'
  require 'omniauth'

  def apply_omniauth(auth)
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email = auth['extra']['raw_info']['email']
    # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
    authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end


  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.token = auth["credentials"]["token"]
      user.secret = auth["credentials"]["secret"]
    end
  end

  def self.get_posts(user)
    access_token = User.prepare_access_token(user)
    response = access_token.get("http://api.tumblr.com/v2/blog/#{user.uid}.tumblr.com/posts/text?api_key=[]")
  end

  def self.new_post(title, body, user)
    access_token = User.prepare_access_token(user)
    response = access_token.post("http://api.tumblr.com/v2/blog/#{user.uid}.tumblr.com/post", {:title => title, :body => body, :type => 'text'})
  end
end
