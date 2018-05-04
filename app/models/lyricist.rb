# == Schema Information
#
# Table name: lyricists
#
#  id         :uuid             not null, primary key
#  artist_id  :uuid             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_lyricists_on_artist_id  (artist_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => artists.id)
#

class Lyricist < ApplicationRecord
  include ArtistModule

  has_many :song_lyricists, dependent: :destroy
  has_many :songs, through: :song_lyricists

  belongs_to :artist
end
