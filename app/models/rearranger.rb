# == Schema Information
#
# Table name: rearrangers
#
#  id          :uuid             not null, primary key
#  artist_id   :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  songs_count :integer          default(0), not null
#
# Indexes
#
#  index_rearrangers_on_artist_id  (artist_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => artists.id)
#

class Rearranger < ApplicationRecord
  include ArtistModule

  has_many :song_rearrangers, dependent: :destroy
  has_many :songs, through: :song_rearrangers

  belongs_to :artist
end
