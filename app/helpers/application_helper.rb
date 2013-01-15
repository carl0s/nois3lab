module ApplicationHelper
  def resize_and_crop(image, size)
    if image[:width] < image[:height]
      remove = ((image[:height] - image[:width])/2).round
      image.shave("0x#{remove}")
    elsif image[:width] > image[:height]
      remove = ((image[:width] - image[:height])/2).round
      image.shave("#{remove}x0")
    end

    image.resize("#{size}x#{size}")
    puts image
    return image
  end
end
