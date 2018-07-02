module Events
  class SongsController < ApplicationController
    def index(title, series_title = nil, year = nil)
      if title.include?("コミックマーケット")
        title, days = title.split('-')
      end
      days = days.presence || 1
      @event = Event.all_includes.find_by(title_ja: title.tr('／', '/'), days: days)
    end
  end
end
