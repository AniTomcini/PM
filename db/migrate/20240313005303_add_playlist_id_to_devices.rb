class AddPlaylistIdToDevices < ActiveRecord::Migration[7.0]
  def change
    add_column :devices, :playlist_id, :int
  end
end
