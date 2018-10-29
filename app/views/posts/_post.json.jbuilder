json.extract! post, :id, :name, :photo, :location, :created_at, :updated_at
json.url post_url(post, format: :json)
