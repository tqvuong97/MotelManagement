class CreateBackupGuests < ActiveRecord::Migration[5.2]
  def change
    create_table :backup_guests do |t|
      t.string :name
      t.date :birth
      t.text :address
      t.string :identitycard
      t.string :phonenumber
      t.string :image
      t.string :job
      t.text :notice
      t.string :email

      t.timestamps
    end
  end
end
