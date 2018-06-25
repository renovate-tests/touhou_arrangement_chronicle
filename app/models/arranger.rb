# == Schema Information
#
# Table name: arrangers
#
#  id          :uuid             not null, primary key
#  artist_id   :uuid             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  songs_count :integer          default(0), not null
#
# Indexes
#
#  index_arrangers_on_artist_id  (artist_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => artists.id)
#

class Arranger < ApplicationRecord
  has_many :song_arrangers, dependent: :destroy
  has_many :songs, through: :song_arrangers
  has_many :circles, through: :songs
  has_many :composers, through: :songs
  has_many :discographies, through: :songs
  has_many :events, through: :songs
  has_many :lyricists, through: :songs
  has_many :vocalists, through: :songs
  has_many :original_songs, through: :songs
  has_many :originals, through: :original_songs
  has_many :rearrangers, through: :songs

  belongs_to :artist

  include ArtistModule
  include OriginalSongModule

  class << self
    def all_includes
      includes(
        :artist,
        songs:
          [
            { arrangers: [:artist] },
            :circle,
            { composers: [:artist] },
            :discography,
            :event,
            { lyricists: [:artist] },
            :original_songs,
            { rearrangers: [:artist] },
            { vocalists: [:artist] },
          ],
      )
    end
  end
end
