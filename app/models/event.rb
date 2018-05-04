# == Schema Information
#
# Table name: events
#
#  id               :uuid             not null, primary key
#  title_ja         :string           not null
#  title_en         :string
#  display_title_ja :string           not null
#  display_title_en :string
#  event_series_id  :uuid             not null
#  times            :integer
#  days             :integer          default(1), not null
#  date             :date
#  note_ja          :text
#  note_en          :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
# Indexes
#
#  index_events_on_event_series_id  (event_series_id)
#

class Event < ApplicationRecord
  has_many :discographies, inverse_of: :event, dependent: :destroy
  has_many :songs, inverse_of: :event, dependent: :destroy

  belongs_to :event_series

  delegate :title_ja, :title_en, to: :event_series, prefix: true, allow_nil: true

  validates :title_ja, presence: true
  validates :display_title_ja, presence: true
end
