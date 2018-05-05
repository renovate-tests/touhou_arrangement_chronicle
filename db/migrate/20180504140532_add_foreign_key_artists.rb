class AddForeignKeyArtists < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :vocalists, :artists
    add_foreign_key :arrangers, :artists
    add_foreign_key :lyricists, :artists
    add_foreign_key :composers, :artists
    add_foreign_key :rearrangers, :artists
  end
end
