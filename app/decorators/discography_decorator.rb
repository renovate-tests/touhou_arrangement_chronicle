module DiscographyDecorator
  def release_event
    date = I18n.l(release_date) if release_date
    if date
      "#{event&.title_ja} (#{date})"
    else
      event&.title_ja
    end
  end

  def event_link
    if event&.days.to_i > 1
      "./#{event&.title_ja&.tr("/", "／")}-#{event&.days}/#{circle&.name_ja&.tr("/", "／")}/#{title_ja&.tr("/", "／")}"
    else
      "./#{event&.title_ja&.tr("/", "／")}/#{circle&.name_ja&.tr("/", "／")}/#{title_ja&.tr("/", "／")}"
    end
  end
end
