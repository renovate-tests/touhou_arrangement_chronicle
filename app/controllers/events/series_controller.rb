module Events
  class SeriesController < ApplicationController
    def show(series_title)
      @event_series = EventSeries.includes(:events).find_by(title_ja: series_title.tr('／', '/'))
      @events = @event_series.events.order(date: :desc)
    end
  end
end
