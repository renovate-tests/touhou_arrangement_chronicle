class EventsController < ApplicationController
  def index
    @event_series = EventSeries.order(:display_order)
    @event_years = Event.distinct.pluck(Arel.sql("date_part('year', date)")).compact.sort.reverse.map(&:to_i)
  end
end
