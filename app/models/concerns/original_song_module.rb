module OriginalSongModule
  extend ActiveSupport::Concern
  included do
    has_many :original_songs, -> { includes(:original) }, through: :songs
    has_many :originals, through: :original_songs
  end

  def originals_count(original_type = nil)
    original_types = [original_type].flatten.select {|ot| Original.original_types.include?(ot) }
    count = if original_types.present?
              self.originals.where(original_type: original_type).merge(Original.group_by_short_title).count(:code)
            else
              self.originals.merge(Original.group_by_short_title).count(:code)
            end
    count.map {|k, v| [k[1], v] }.to_h
  end

  def original_songs_count(original = nil)
    count = if original.class.name == "Original"
              self.original_songs.where(original: original).merge(OriginalSong.group_by_title).count
            else
              self.original_songs.merge(OriginalSong.group_by_title).count
            end
    count.map {|k, v| [k[1], v] }.to_h
  end
end
