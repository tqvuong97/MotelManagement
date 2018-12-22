class Device < ApplicationRecord
  has_and_belongs_to_many :rooms
  has_many :devices_rooms
end
