class EventsController < ApplicationController
  def index
    @event_series = EventSeries.order(:display_order)
    @event_years = Event.distinct.pluck(Arel.sql("date_part('year', date)")).compact.sort.reverse.map(&:to_i)
  end

  def show(title, series_title = nil, year = nil, days = 1)
    @event = Event.includes(:event_series, discographies: :circle).find_by(title_ja: title.tr('／', '/'), days: days)
  end
end
