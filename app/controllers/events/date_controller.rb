module Events
  class DateController < ApplicationController
    def show(year)
      @year = year
      date = Date.new(year.to_i, 1, 1)
      @events = Event.where(date: date.beginning_of_year..date.end_of_year).order(:date)
    end
  end
end
