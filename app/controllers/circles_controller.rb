class CirclesController < ApplicationController
  def index
  end

  def show(name)
    @circle = Circle.includes(discographies: [:event]).find_by(name_ja: name.tr('／', '/'))
  end
end
