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
  has_many :song_vocalists, dependent: :destroy
  has_many :vocalists, through: :song_vocalists

  belongs_to :circle, optional: true
  belongs_to :discography, optional: true
  belongs_to :event, optional: true

  validates :title_ja, presence: true
end
