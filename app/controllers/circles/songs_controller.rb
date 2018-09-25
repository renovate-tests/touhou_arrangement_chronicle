module Circles
  class SongsController < ApplicationController
    def index(circle_name)
      @circle = Circle.all_includes.find_by(name_ja: circle_name.tr('／', '/'))
    end
  end
end
