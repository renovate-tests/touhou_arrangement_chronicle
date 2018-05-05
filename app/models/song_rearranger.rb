# == Schema Information
#
# Table name: song_rearrangers
#
#  id            :uuid             not null, primary key
#  song_id       :uuid             not null
#  rearranger_id :uuid             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_song_rearrangers_on_rearranger_id  (rearranger_id)
#  index_song_rearrangers_on_song_id        (song_id)
#
# Foreign Keys
#
#  fk_rails_...  (rearranger_id => rearrangers.id)
#  fk_rails_...  (song_id => songs.id)
#

class SongRearranger < ApplicationRecord
  belongs_to :song
  belongs_to :rearranger

  counter_culture :rearranger, column_name: 'songs_count', touch: true
end
