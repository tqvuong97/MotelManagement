
class Billing < ApplicationRecord
  belongs_to :services_room
  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |billing|
          csv << billing.attributes.values_at(*column_names)
      end
    end
  end
end
