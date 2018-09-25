module Events
  class DiscographiesController < ApplicationController
    def show(discography_title, circle_name, event_title)
      @discography = Discography.all_includes.find_by(
        title_ja: discography_title.tr('／', '/'),
        circles: { name_ja: circle_name.tr('／', '/') },
        events: { title_ja: event_title.tr('／', '/') },
      )
      render 'circles/discographies/show'
    end
  end
end
