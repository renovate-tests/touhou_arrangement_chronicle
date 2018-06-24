module Circles
  class StatisticsController < ApplicationController
    def index(circle_name)
      @circle = Circle.includes(discographies: [:event]).find_by(name_ja: circle_name.tr('／', '/'))
    end
  end
end
