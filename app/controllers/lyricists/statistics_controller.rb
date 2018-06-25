module Lyricists
  class StatisticsController < ApplicationController
    def index(lyricist_name)
      @lyricist = Lyricist.includes(:artist).find_by(artists: { name_ja: lyricist_name.tr('／', '/') })
    end
  end
end
