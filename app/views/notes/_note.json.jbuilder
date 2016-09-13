json.extract! note, :id, :date, :time, :progress, :treatment, :user_id, :remarks, :created_at, :updated_at
json.url note_url(note, format: :json)