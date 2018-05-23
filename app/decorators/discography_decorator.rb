module DiscographyDecorator
  def release_event
    date = I18n.l(release_date) if release_date
    if date
      "#{event&.title_ja} (#{date})"
    else
      event&.title_ja
    end
  end
end
