class Work < ActiveRecord::Base
  attr_accessible :content, :name, :client_id, :teammate_id, :media_id, :service_id, :is_public, :is_event, :year, :is_recap, :tags
  belongs_to :clients
  has_many :tags
  validates :name, :presence => true
  validates :year, :presence => true
  validates :teammate_id, :presence => true
  validates :service_id, :presence => true
  validates :client_id, :presence => true

  extend FriendlyId
  friendly_id :name, :use => :slugged

  def client
    client = Behance::Client.new(access_token: "clRawMwGg12qBuxUMW2NBsNBkgdfdRJy")
  end

end
