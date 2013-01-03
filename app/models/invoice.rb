class Invoice < ActiveRecord::Base
  attr_accessible :description, :doc_id, :name
  belongs_to :client
  has_many :items
end
