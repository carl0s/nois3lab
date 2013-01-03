class MediaAsset < ActiveRecord::Base
  attr_accessible :name, :image, :image_cache, :category
  mount_uploader :image, MediaAssetUploader
  has_many :works
  has_many :teammates
  has_many :posts
  has_many :skills
  has_many :tags

  validates :name, :presence => true
  validates :image, :presence => true
end
