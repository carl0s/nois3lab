class JobPosition < ActiveRecord::Base
  attr_accessible :content, :name
  belongs_to :teammate
  has_one :teammate

  validates :name, :presence => true
end
