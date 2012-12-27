class Post < ActiveRecord::Base
  attr_accessible :content, :title
  has_many :teammates

  validates :name, :presence => true
end
