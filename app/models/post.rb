class Post < ActiveRecord::Base

  attr_accessible :content, :title
  has_many :teammates

  validates :title, :presence => true

  extend FriendlyId
  friendly_id :title, :use => :slugged


end
