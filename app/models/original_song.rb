# == Schema Information
#
# Table name: original_songs
#
#  id            :uuid             not null, primary key
#  code          :string           not null
#  title_ja      :string
#  title_en      :string
#  original_code :string           not null
#  composer      :string
#  track_number  :integer
#  is_duplicate  :boolean          default(FALSE), not null
#  is_hidden     :boolean          default(FALSE), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  songs_count   :integer          default(0), not null
#
# Indexes
#
#  index_original_songs_on_code                            (code) UNIQUE
#  index_original_songs_on_original_code                   (original_code)
#  index_original_songs_on_original_code_and_track_number  (original_code,track_number) UNIQUE
#

class OriginalSong < ApplicationRecord
  has_many :song_original_songs, dependent: :destroy
  has_many :songs, through: :song_original_songs

  belongs_to :original, foreign_key: :original_code, primary_key: :code, inverse_of: :original_songs

  delegate :title_ja, :title_en, :short_title_ja, :short_title_en, :original_type,
    to: :original, prefix: true, allow_nil: true

  scope :duplicate, -> { where(is_duplicate: true) }
  scope :not_duplicate, -> { where(is_duplicate: false) }
  scope :order_by_track_number_asc, -> { order("track_number ASC") }

  validates :title_ja, presence: true
  validates :original_code, presence: true
  validates :track_number, presence: true
  validates :track_number, numericality: { only_integer: true, greater_than: 0, less_than: 100 }
  before_save :set_code

  extend FriendlyId
  friendly_id :title_ja

  class << self
    def all_includes
      includes(
        :original,
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

  private

    def set_code
      self.code = "#{original_code}#{"%02d" % track_number}"
    end

    def original_title_and_original_song_title
      "#{original.short_title_ja}-#{title_ja}"
    end
end
