module Circles
  class DiscographiesController < ApplicationController
    def index(circle_name)
      @circle = Circle.includes(discographies: [:event]).find_by(name_ja: circle_name.tr('／', '/'))
    end

    def show(circle_name, title)
      @discography = Discography.all_includes.find_by(title_ja: title, circles: { name_ja: circle_name })
    end
  end
end
