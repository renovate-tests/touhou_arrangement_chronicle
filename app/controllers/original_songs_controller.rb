class OriginalSongsController < ApplicationController
  def index
    @originals = Original.all
  end
end
