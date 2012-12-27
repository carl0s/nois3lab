class Service < ActiveRecord::Base
  attr_accessible :content, :name
  has_many :works
  has_many :teammates

  validates :name, :presence => true
end
