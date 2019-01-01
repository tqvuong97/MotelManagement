class AddExpiredAtToAdmin < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :expired_at, :datetime
  end
end
