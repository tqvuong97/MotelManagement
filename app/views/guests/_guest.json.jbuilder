json.extract! guest, :id, :name, :birth, :address, :identitycard, :phonenumber, :image, :job, :notice, :created_at, :updated_at
json.url guest_url(guest, format: :json)
