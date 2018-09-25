# == Schema Information
#
# Table name: event_series
#
#  id            :uuid             not null, primary key
#  title_ja      :string
#  title_en      :string
#  display_order :integer          default(0), not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class EventSeries < ApplicationRecord
  has_many :events, inverse_of: :event_series, dependent: :destroy

  validates :title_ja, presence: true
end
