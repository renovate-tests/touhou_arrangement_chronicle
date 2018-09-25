class AddIndexUniqueArtistId < ActiveRecord::Migration[5.2]
  def change
    remove_index :vocalists, :artist_id
    add_index :vocalists, :artist_id, unique: true
    remove_index :arrangers, :artist_id
    add_index :arrangers, :artist_id, unique: true
    remove_index :lyricists, :artist_id
    add_index :lyricists, :artist_id, unique: true
    remove_index :composers, :artist_id
    add_index :composers, :artist_id, unique: true
    remove_index :rearrangers, :artist_id
    add_index :rearrangers, :artist_id, unique: true
  end
end
