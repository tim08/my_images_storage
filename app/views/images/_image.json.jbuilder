json.extract! image, :id, :album_id, :created_at, :updated_at
json.url image_url(image, format: :json)