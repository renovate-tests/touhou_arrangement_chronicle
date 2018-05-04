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

  scope :order_by_code_asc, -> { order("code ASC") }
end
