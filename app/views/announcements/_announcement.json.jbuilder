json.extract! announcement, :id, :announcement_title, :content, :user_id, :created_at, :updated_at
json.url announcement_url(announcement, format: :json)
