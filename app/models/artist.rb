# == Schema Information
#
# Table name: artists
#
#  id              :uuid             not null, primary key
#  name_ja         :string           not null
#  name_en         :string
#  site_url        :string
#  blog_url        :string
#  note_ja         :text
#  note_en         :text
#  category        :string           not null
#  detail_category :string           not null
#  circle_id       :uuid
#  user_id         :uuid
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_artists_on_circle_id  (circle_id)
#  index_artists_on_user_id    (user_id)
#

class Artist < ApplicationRecord
  include CategoryModule

  has_one :vocalist, inverse_of: :artist, dependent: :destroy

  belongs_to :circle, optional: true
  belongs_to :user, optional: true

  validates :name_ja, presence: true
end
