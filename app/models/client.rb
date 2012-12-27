class Client < ActiveRecord::Base
  attr_accessible :content, :name, :url
  has_many :works
end
