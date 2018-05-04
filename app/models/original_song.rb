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
#
# Indexes
#
#  index_original_songs_on_code           (code) UNIQUE
#  index_original_songs_on_original_code  (original_code)
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

  validates :code, presence: true
  validates :title_ja, presence: true
  validates :original_code, presence: true
end
