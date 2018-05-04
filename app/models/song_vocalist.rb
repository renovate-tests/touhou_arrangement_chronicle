# == Schema Information
#
# Table name: song_vocalists
#
#  id          :uuid             not null, primary key
#  song_id     :uuid             not null
#  vocalist_id :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_song_vocalists_on_song_id      (song_id)
#  index_song_vocalists_on_vocalist_id  (vocalist_id)
#
# Foreign Keys
#
#  fk_rails_...  (song_id => songs.id)
#  fk_rails_...  (vocalist_id => vocalists.id)
#

class SongVocalist < ApplicationRecord
  belongs_to :song
  belongs_to :vocalist
end
