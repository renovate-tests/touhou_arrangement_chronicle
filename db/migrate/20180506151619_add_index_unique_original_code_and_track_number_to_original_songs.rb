class AddIndexUniqueOriginalCodeAndTrackNumberToOriginalSongs < ActiveRecord::Migration[5.2]
  def change
    add_index :original_songs, [:original_code, :track_number], unique: true
  end
end
