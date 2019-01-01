class AddRoleToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :role, :string
  end
end
