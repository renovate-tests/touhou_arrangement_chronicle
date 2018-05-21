class VocalistsController < ApplicationController
  def index
  end

  def show(name)
    @vocalist = Vocalist.all_includes.find_by(artists: { name_ja: name.tr('／', '/') })
  end
end
