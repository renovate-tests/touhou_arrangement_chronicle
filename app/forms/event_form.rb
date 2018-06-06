class EventForm
  include ActiveModel::Model

  attr_accessor :series_title, :title, :display_title, :times, :days, :date

  validates :series_title, presence: true
  validates :title, presence: true
  validates :display_title, presence: true
  validates :times, presence: true
  validates :times, numericality: { only_integer: true }
  validates :days, inclusion: "1".."3", allow_nil: true
  validates :date, presence: true

  def save
    return false if invalid?

    event_series = EventSeries.find_or_create_by!(title_ja: series_title)
    Event.create!(title_ja: title, display_title_ja: display_title, times: times, days: days, date: date, event_series: event_series)
    true
  end
end
