json.extract! post, :id, :sport_name, :title, :image, :description, :tag, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
