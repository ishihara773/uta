class AddArtistAndLyricsToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :artist, :string
    add_column :posts, :lyrics, :text
  end
end
