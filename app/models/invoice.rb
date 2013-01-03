class Invoice < ActiveRecord::Base
  attr_accessible :description, :doc_id, :invoice_id, :client_id, :name
  belongs_to :client
  has_many :items

end
