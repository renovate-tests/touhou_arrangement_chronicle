class OriginalSongsController < ApplicationController
  def index
    @originals = Original.includes(:original_songs).all
  end

  def show
    @original_song = OriginalSong.all_includes.order(Arel.sql('"circles"."name_ja" ASC')).friendly.find(params[:id])
    if request.path != original_song_path(@original_song)
      redirect_to @original_song, status: :moved_permanently
    end
  end
end
