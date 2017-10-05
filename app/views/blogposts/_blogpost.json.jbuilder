json.extract! blogpost, :id, :title, :image_url, :blog, :date_posted, :creator, :created_at, :updated_at
json.url blogpost_url(blogpost, format: :json)
