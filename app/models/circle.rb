# == Schema Information
#
# Table name: circles
#
#  id              :uuid             not null, primary key
#  name_ja         :string           not null
#  name_en         :string
#  circle_type     :string           default("general"), not null
#  site_url        :string
#  blog_url        :string
#  category        :string           not null
#  detail_category :string           not null
#  note_ja         :text
#  note_en         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_circles_on_name_ja  (name_ja) UNIQUE
#

class Circle < ApplicationRecord
  include CategoryModule

  has_many :artists, inverse_of: :circle, dependent: :destroy
  has_many :discographies, inverse_of: :circle, dependent: :destroy
  has_many :songs, inverse_of: :circle, dependent: :destroy
  has_many :events, through: :discographies

  validates :name_ja, presence: true

  enum circle_type: {
    originator: 'originator',
    general: 'general',
    union: 'union',
    enterprise: 'enterprise',
  }

  class << self
    def all_includes
      includes(
        discographies:
          [
            :event,
          ],
        songs:
          [
            { arrangers: [:artist] },
            :circle,
            { composers: [:artist] },
            { lyricists: [:artist] },
            :discography,
            :original_songs,
            { rearrangers: [:artist] },
            { vocalists: [:artist] },
          ],
      )
    end
  end
end
