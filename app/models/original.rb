# == Schema Information
#
# Table name: originals
#
#  id             :uuid             not null, primary key
#  code           :string           not null
#  title_ja       :string
#  title_en       :string
#  short_title_ja :string
#  short_title_en :string
#  original_type  :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_originals_on_code  (code) UNIQUE
#

class Original < ApplicationRecord
  enum original_type: {
    pc98: 'pc98',
    windows: 'windows',
    zuns_music_collection: 'zuns_music_collection',
    akyus_untouched_score: 'akyus_untouched_score',
    commercial_books: 'commercial_books',
    other: 'other',
  }

  has_many :original_songs, -> { order(Arel.sql('"original_songs"."track_number" ASC')) },
    foreign_key: :original_code,
    primary_key: :code,
    inverse_of: :original,
    dependent: :destroy

  scope :order_by_code_asc, -> { order("code ASC") }
  scope :group_by_short_title, -> { group(:code, :short_title_ja).reorder(:code) }

  validates :code, presence: true
  validates :title_ja, presence: true
  validates :short_title_ja, presence: true
  validates :original_type, presence: true
end
