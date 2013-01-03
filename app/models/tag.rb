class Tag < ActiveRecord::Base
  belongs_to :work
  attr_accessible :name

  validates :name, :presence => true

  extend FriendlyId
  friendly_id :name, :use => :slugged

end
