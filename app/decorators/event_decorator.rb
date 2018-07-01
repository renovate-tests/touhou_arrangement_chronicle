module EventDecorator
  def display_title
    if date
      "#{title} (#{I18n.l(date)})"
    else
      title
    end
  end

  def title
    if title_ja.include?("コミックマーケット")
      "#{title_ja} - #{days}日目"
    else
      title_ja
    end
  end

  def event_url(year = nil)
    if year
      if title_ja.include?("コミックマーケット") && days > 1
        events_date_days_show_path(year: year, title: title_ja, days: days)
      else
        events_date_show_path(year: year, title: title_ja)
      end
    else
      if title_ja.include?("コミックマーケット") && days > 1
        events_series_days_show_path(series_title: event_series&.title_ja, title: title_ja, days: days)
      else
        events_series_show_path(series_title: event_series&.title_ja, title: title_ja)
      end
    end
  end

  def event_songs_url(year = nil)
    if year
      if title_ja.include?("コミックマーケット") && days > 1
        events_date_days_songs_path(year: year, title: title_ja, days: days)
      else
        events_date_songs_path(year: year, title: title_ja)
      end
    else
      if title_ja.include?("コミックマーケット") && days > 1
        events_series_days_songs_path(series_title: event_series&.title_ja, title: title_ja, days: days)
      else
        events_series_songs_path(series_title: event_series&.title_ja, title: title_ja)
      end
    end
  end
end
