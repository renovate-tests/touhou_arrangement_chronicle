class AddSongsCount < ActiveRecord::Migration[5.2]
  def change
    add_column :arrangers, :songs_count, :integer, null: false, default: 0
    add_column :composers, :songs_count, :integer, null: false, default: 0
    add_column :lyricists, :songs_count, :integer, null: false, default: 0
    add_column :original_songs, :songs_count, :integer, null: false, default: 0
    add_column :rearrangers, :songs_count, :integer, null: false, default: 0
    add_column :vocalists, :songs_count, :integer, null: false, default: 0
  end
end
