class EventsController < ApplicationController
  def index
    @event_series = EventSeries.order(:display_order)
    @event_years = Event.distinct.pluck(Arel.sql("date_part('year', date)")).compact.sort.reverse.map(&:to_i)
  end

  def new
    require_login
    @event_form = EventForm.new
    @series = EventSeries.order(:display_order)
  end

  def create
    @event_form = EventForm.new(event_form_params)
    if verify_recaptcha(model: @event_form) && @event_form.save
      if @event_form.series_title == "コミックマーケット"
        redirect_to events_series_days_show_path(series_title: @event_form.series_title, title: @event_form.title, days: @event_form.days)
      else
        redirect_to events_series_show_path(series_title: @event_form.series_title, title: @event_form.title)
      end
    else
      @series = EventSeries.order(:display_order)
      render :new
    end
  end

  def show(title, series_title = nil, year = nil)
    if series_title == "コミックマーケット"
      title, days = title.split('-')
    end
    days = days.presence || 1
    @event = Event.includes(:event_series, discographies: :circle).find_by(title_ja: title.tr('／', '/'), days: days)
  end

  private

    def event_form_params
      params.require(:event_form).permit(:series_title, :title, :display_title, :times, :days, :date)
    end
end
