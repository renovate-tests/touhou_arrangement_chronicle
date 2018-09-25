class ArtistsController < ApplicationController
  def index
  end

  def show(name)
    @artist = Artist.find_by(name_ja: name.tr('／', '/'))
  end
end
