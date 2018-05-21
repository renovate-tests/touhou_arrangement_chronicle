class ArrangersController < ApplicationController
  def index
  end

  def show(name)
    @arranger = Arranger.all_includes.find_by(artists: { name_ja: name.tr('／', '/') })
  end
end
