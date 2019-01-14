class AddDeletedAtToBackupGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :backup_guests, :deleted_at, :datetime
  end
end
