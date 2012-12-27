class Teammate < ActiveRecord::Base
  attr_accessible :bio, :facebook, :fullname, :linkedin, :twitter, :service_id, :image_id
  has_many :works
end
