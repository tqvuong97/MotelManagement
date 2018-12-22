json.extract! device, :id, :name, :branch, :quantity, :status, :price, :created_at, :updated_at
json.url device_url(device, format: :json)
