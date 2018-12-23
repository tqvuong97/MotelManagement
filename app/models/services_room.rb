class ServicesRoom < ApplicationRecord
  belongs_to :room
  has_many :billings
end
