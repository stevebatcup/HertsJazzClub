class ContentImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file


  version :large do
    process resize_to_fill: [480, 480]

    def store_dir
      "uploads/#{Rails.env}/page_content/#{model.page}"
    end
  end

  version :small do
    process resize_to_fill: [250, 250]

    def store_dir
      "uploads/#{Rails.env}/page_content/#{model.page}"
    end
  end

  def store_dir
    "uploads/#{Rails.env}/page_content/#{model.page}"
  end
end
