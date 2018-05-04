# == Schema Information
#
# Table name: song_original_songs
#
#  id               :uuid             not null, primary key
#  song_id          :uuid             not null
#  original_song_id :uuid             not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_song_original_songs_on_original_song_id  (original_song_id)
#  index_song_original_songs_on_song_id           (song_id)
#
# Foreign Keys
#
#  fk_rails_...  (original_song_id => original_songs.id)
#  fk_rails_...  (song_id => songs.id)
#

class SongOriginalSong < ApplicationRecord
  belongs_to :song
  belongs_to :original_song
end
