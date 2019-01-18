class Guest < ApplicationRecord
  attr_accessor :image
  belongs_to :room

  mount_uploader :image, ImageUploader
end
