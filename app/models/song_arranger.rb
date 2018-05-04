# == Schema Information
#
# Table name: song_arrangers
#
#  id          :uuid             not null, primary key
#  song_id     :uuid             not null
#  arranger_id :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_song_arrangers_on_arranger_id  (arranger_id)
#  index_song_arrangers_on_song_id      (song_id)
#
# Foreign Keys
#
#  fk_rails_...  (arranger_id => arrangers.id)
#  fk_rails_...  (song_id => songs.id)
#

class SongArranger < ApplicationRecord
  belongs_to :song
  belongs_to :arranger
end
