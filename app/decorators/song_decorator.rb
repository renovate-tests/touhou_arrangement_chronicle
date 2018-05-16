module SongDecorator
  def release_date
    if discography&.release_date
      I18n.l(discography&.release_date)
    end
  end

  def arrangers_list
    safe_join(arrangers&.map {|a| a.name_ja }, tag.br)
  end

  def composers_list
    if composers.present?
      safe_join(composers&.map {|c| c.name_ja }, tag.br)
    else
      safe_join(original_songs&.map {|os| os.composer }.uniq, tag.br)
    end
  end

  def lyricists_list
    safe_join(lyricists&.map {|l| l.name_ja }, tag.br)
  end

  def rearrangers_list
    safe_join(rearrangers&.map {|ra| ra.name_ja }, tag.br)
  end

  def vocalists_list
    safe_join(vocalists&.map {|v| v.name_ja }, tag.br)
  end

  def original_songs_list
    safe_join(original_songs&.map {|os| os.title_ja }, tag.br)
  end
end
