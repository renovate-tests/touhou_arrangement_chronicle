class OriginalSongsController < ApplicationController
  def index
    @originals = Original.includes(:original_songs).all
  end

  def show(original_song_title)
    @original_song = OriginalSong.all_includes.order(Arel.sql('"circles"."name_ja" ASC')).find_by(title_ja: original_song_title)
  end
end
