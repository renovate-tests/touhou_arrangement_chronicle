class SongSerializer < ApplicationSerializer
  attributes :title_ja, :title_en, :track_number, :length, :bpm
  attributes :vocalists, :composers, :arrangers, :rearrangers, :lyricists, :original_songs
  attributes :circle, :discography, :event

  def vocalists
    object&.vocalists&.map {|v| v.name_ja }
  end

  def composers
    object&.composers&.map {|c| c.name_ja }
  end

  def arrangers
    object&.arrangers&.map {|a| a.name_ja }
  end

  def rearrangers
    object&.rearrangers&.map {|ra| ra.name_ja }
  end

  def lyricists
    object&.lyricists&.map {|l| l.name_ja }
  end

  def original_songs
    object&.original_songs&.map {|os| os.title_ja }
  end

  def circle
    object&.circle_name_ja
  end

  def discography
    object&.discography_title_ja
  end

  def event
    object&.event_title_ja
  end
end
