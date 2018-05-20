module Api
  module V1
    class ArrangersController < ApplicationController
      def index
        if request.query_parameters.present?
          parameters = ArrangersParameter.new(request.query_parameters).define_params
          @arrangers = Arranger.artist.where(artists: parameters)
        else
          @arrangers = Arranger.artist
        end
        render json: @arrangers
      end
    end
  end
end
