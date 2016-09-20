json.extract! room, :id, :room_no, :category_id, :room_rent, :beds, :created_at, :updated_at
json.url room_url(room, format: :json)