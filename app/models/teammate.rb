class Teammate < ActiveRecord::Base
  attr_accessible :bio, :facebook, :fullname, :linkedin, :twitter, :service_id, :image_id
  has_many :works
  has_many :tags
  has_many :skills
  has_one :job_position

  validates :fullname, :presence => true
end
