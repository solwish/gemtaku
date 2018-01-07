json.extract! escape, :id, :user_id, :title, :contents, :created_at, :updated_at
json.url escape_url(escape, format: :json)
