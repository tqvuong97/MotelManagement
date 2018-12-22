json.extract! room, :id, :name, :status, :price, :slot, :created_at, :updated_at
json.url room_url(room, format: :json)
