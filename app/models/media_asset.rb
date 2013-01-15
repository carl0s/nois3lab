class MediaAsset < ActiveRecord::Base
  attr_accessible :name, :image, :image_cache, :category, :work_id, :teammate_id, :client_id, :service_id, :tag_id, :behance_src, :behance_embed
  mount_uploader :image, MediaAssetUploader
  has_many :works
  has_many :teammates
  has_many :posts
  has_many :skills
  has_many :tags

  validates :name, :presence => true

  # def resize_and_crop(image, size)
  #   if image[:width] < image[:height]
  #     remove = ((image[:height] - image[:width])/2).round
  #     image.shave("0x#{remove}")
  #   elsif image[:width] > image[:height]
  #     remove = ((image[:width] - image[:height])/2).round
  #     image.shave("#{remove}x0")
  #   end
  #   image.resize("#{size}x#{size}")
  #   return image
  # end



end

