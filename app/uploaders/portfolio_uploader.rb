class PortfolioUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :aws

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end


  version :thumb do
    process :resize_to_fill => [300,300]
  end

 

end
