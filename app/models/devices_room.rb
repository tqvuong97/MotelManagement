class DevicesRoom < ApplicationRecord
  belongs_to :room
  belongs_to :device
end
