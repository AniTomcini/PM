class AddPlaylistIdToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :playlist_id, :int
  end
end
