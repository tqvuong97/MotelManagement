class AddAdminDefToServices < ActiveRecord::Migration[5.2]
  def change
    add_reference :services, :admin, foreign_key: true
  end
end
