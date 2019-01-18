class AddTriggerToGuests < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
      
      create trigger backupg before insert on guests
      for each row
      begin
        insert into backup_guests set 
          backup_guests.id = new.id,
          backup_guests.name = new.name,
          backup_guests.birth = new.birth,
              backup_guests.address = new.address,
              backup_guests.identitycard = new.identitycard,
              backup_guests.phonenumber = new.phonenumber,
              backup_guests.image = new.image,
              backup_guests.job= new.job,
              backup_guests.notice = new.notice,
              backup_guests.room_id = new.room_id,
              backup_guests.email = new.email,
          backup_guests.created_at = now(),
          backup_guests.updated_at = now();
      END
      

    SQL
  end
end
