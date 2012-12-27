class EventDetail < ActiveRecord::Base
  attr_accessible :content, :name, :participants_n
  belongs_to :works
  has_one :work

  validates :name, :presence => true
end
