# == Schema Information
#
# Table name: song_lyricists
#
#  id          :uuid             not null, primary key
#  song_id     :uuid             not null
#  lyricist_id :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_song_lyricists_on_lyricist_id  (lyricist_id)
#  index_song_lyricists_on_song_id      (song_id)
#
# Foreign Keys
#
#  fk_rails_...  (lyricist_id => lyricists.id)
#  fk_rails_...  (song_id => songs.id)
#

class SongLyricist < ApplicationRecord
  belongs_to :song
  belongs_to :lyricist
end
