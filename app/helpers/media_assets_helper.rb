module MediaAssetsHelper

  def media_picker
    @media = MediaAsset.find :all
    if !@media.nil?
      render "media_assets/picker"
    end
  end

end
