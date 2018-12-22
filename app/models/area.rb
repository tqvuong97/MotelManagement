class Area < ApplicationRecord
  has_many :rooms
  belongs_to :admin
end
