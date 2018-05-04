# == Schema Information
#
# Table name: song_composers
#
#  id          :uuid             not null, primary key
#  song_id     :uuid             not null
#  composer_id :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_song_composers_on_composer_id  (composer_id)
#  index_song_composers_on_song_id      (song_id)
#
# Foreign Keys
#
#  fk_rails_...  (composer_id => composers.id)
#  fk_rails_...  (song_id => songs.id)
#

class SongComposer < ApplicationRecord
  belongs_to :song
  belongs_to :composer

  counter_culture :composer, column_name: 'songs_count', touch: true
end
