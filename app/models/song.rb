# == Schema Information
#
# Table name: songs
#
#  id             :uuid             not null, primary key
#  title_ja       :string           not null
#  title_en       :string
#  track_number   :integer
#  length         :integer
#  bpm            :integer
#  circle_id      :uuid
#  discography_id :uuid
#  event_id       :uuid
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_songs_on_circle_id       (circle_id)
#  index_songs_on_discography_id  (discography_id)
#  index_songs_on_event_id        (event_id)
#

class Song < ApplicationRecord
  has_many :song_arrangers, dependent: :destroy
  has_many :arrangers, through: :song_arrangers
  has_many :song_composers, dependent: :destroy
  has_many :composers, through: :song_composers
  has_many :song_lyricists, dependent: :destroy
  has_many :lyricists, through: :song_lyricists
  has_many :song_original_songs, dependent: :destroy
  has_many :original_songs, through: :song_original_songs
  has_many :song_rearrangers, dependent: :destroy
  has_many :rearrangers, through: :song_rearrangers
  has_many :song_vocalists, dependent: :destroy
  has_many :vocalists, through: :song_vocalists

  belongs_to :circle, optional: true
  belongs_to :discography, optional: true
  belongs_to :event, optional: true

  delegate :name_ja, to: :circle, allow_nil: true, prefix: true
  delegate :title_ja, to: :discography, allow_nil: true, prefix: true
  delegate :title_ja, to: :event, allow_nil: true, prefix: true

  validates :title_ja, presence: true
end
