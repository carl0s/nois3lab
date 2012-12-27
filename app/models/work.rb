class Work < ActiveRecord::Base
  attr_accessible :content, :name, :client_id, :teammate_id, :media_id, :service_id
  belongs_to :clients
  has_many :tags
end
