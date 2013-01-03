class Item < ActiveRecord::Base
  attr_accessible :description, :invoice_id, :name
end
