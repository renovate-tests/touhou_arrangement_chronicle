module Api
  module V1
    class LyricistsController < ApplicationController
      def index
        if request.query_parameters.present?
          parameters = LyricistsParameter.new(request.query_parameters).define_params
          @lyricists = Lyricist.artist.where(artists: parameters)
        else
          @lyricists = Lyricist.artist
        end
        render json: @lyricists&.sort_by(&:name_ja)
      end
    end
  end
end
