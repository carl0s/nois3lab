class Post < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :teammates

  validates :name, :presence => true

  extend FriendlyId
  friendly_id :name, :use => :slugged

end
