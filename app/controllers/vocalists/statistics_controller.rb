module Vocalists
  class StatisticsController < ApplicationController
    def index(vocalist_name)
      @vocalist = Vocalist.includes(:artist).find_by(artists: { name_ja: vocalist_name.tr('／', '/') })
    end
  end
end
