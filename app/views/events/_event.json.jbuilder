json.extract! event, :id, :type, :user_id, :created_at, :updated_at
json.url event_url(event, format: :json)