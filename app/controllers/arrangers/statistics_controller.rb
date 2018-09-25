module Arrangers
  class StatisticsController < ApplicationController
    def index(arranger_name)
      @arranger = Arranger.includes(:artist).find_by(artists: { name_ja: arranger_name.tr('／', '/') })
    end
  end
end
