require 'rubygems'
require 'zip'
class ImagesPacker

  def initialize(images)
    @images = images
  end

  def pack
    # for remote stores(amazon s3, dropbox ) use .copy_to_local_file (wrap open-uri.open)
    # for local files
    tmp_filename = "#{Rails.root}/tmp/tmp_zip_" <<
        Time.now.strftime("%Y%m%d%H%M%S").to_s <<
        rand(1_000_000).to_s <<
        ".zip"
    Zip::File.open(tmp_filename, Zip::File::CREATE) do |zip|
      @images.each do |e|
        zip.add("#{rand(1_000_000)}_#{e.img_file_name}", e.img.path)
      end
    end
    tmp_filename
  end

end