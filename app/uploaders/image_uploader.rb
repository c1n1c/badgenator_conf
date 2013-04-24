# coding: utf-8
class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version(:thumb) { process :resize_to_limit => [50, 50] }
  version(:badge) { process :resize_to_limit => [120, 120] }

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end
