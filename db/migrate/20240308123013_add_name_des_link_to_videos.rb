class AddNameDesLinkToVideos < ActiveRecord::Migration[7.0]
  def change
    add_column :videos, :title, :string
    add_column :videos, :description, :text
    add_column :videos, :link, :string
  end
end
