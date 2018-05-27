class LyricistsController < ApplicationController
  def index
  end

  def show(name)
    @lyricist = Lyricist.all_includes.find_by(artists: { name_ja: name.tr('／', '/') })
  end
end
