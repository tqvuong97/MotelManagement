class AddTriggerToGuests < ActiveRecord::Migration[5.2]

    def up
      execute <<-SQL
      drop trigger if exists backupg;

      SQL
    end

end
