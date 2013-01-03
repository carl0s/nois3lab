class Skill < ActiveRecord::Base
  attr_accessible :content, :name

  validates :name, :presence => true

  extend FriendlyId
  friendly_id :name, use: :slugged

end
