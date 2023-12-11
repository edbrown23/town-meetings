json.extract! meeting, :id, :title, :status, :recording_url, :created_at, :updated_at
json.url meeting_url(meeting, format: :json)
