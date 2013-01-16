class Taxis < ActiveRecord::Base
  attr_accessible :description, :name, :value
  belongs_to :invoice


end
