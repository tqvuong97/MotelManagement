class Room < ApplicationRecord
  belongs_to :area
  belongs_to :admin
  has_and_belongs_to_many :devices
  has_many :devices_rooms
  has_many :guests
  has_many :services_rooms

end
