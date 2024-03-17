class AddUserIdToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :user_id, :int
  end
end
