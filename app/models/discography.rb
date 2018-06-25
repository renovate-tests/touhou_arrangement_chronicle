# == Schema Information
#
# Table name: discographies
#
#  id           :uuid             not null, primary key
#  title_ja     :string           not null
#  title_en     :string
#  release_date :date
#  circle_id    :uuid
#  event_id     :uuid
#  part_number  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_discographies_on_circle_id  (circle_id)
#  index_discographies_on_event_id   (event_id)
#

class Discography < ApplicationRecord
  has_many :songs, inverse_of: :discography, dependent: :destroy

  belongs_to :circle, optional: true
  belongs_to :event, optional: true

  validates :title_ja, presence: true

  class << self
    def all_includes
      includes(
        :circle,
        :event,
        songs:
          [
            { arrangers: [:artist] },
            :circle,
            { composers: [:artist] },
            { lyricists: [:artist] },
            :original_songs,
            { rearrangers: [:artist] },
            { vocalists: [:artist] },
          ],
      )
    end
  end
end
