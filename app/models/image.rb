class Image < ApplicationRecord

  has_attached_file :img, styles: {
      watermarked: {
          processors: [:watermark],
          geometry: "500x500>",
          watermark_path: Rails.root.join('app/assets/images/watermark.png'),
          position: "Center"
      },
      thumb: "100x100#"
  }
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/

  belongs_to :album
  belongs_to :user

end
