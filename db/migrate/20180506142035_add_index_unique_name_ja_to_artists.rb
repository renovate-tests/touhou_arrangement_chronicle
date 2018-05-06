class AddIndexUniqueNameJaToArtists < ActiveRecord::Migration[5.2]
  def change
    add_index :artists, :name_ja, unique: true
  end
end
