class CirclesController < ApplicationController
  def index
  end

  def show(name)
    @circle = Circle.find_by(name_ja: name.tr('／', '/'))
  end
end
