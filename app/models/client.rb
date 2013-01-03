class Client < ActiveRecord::Base
  attr_accessible :content, :name, :url
  has_many :works

  validates :name, :presence => true

  extend FriendlyId
  friendly_id :name, :use => :slugged

end
