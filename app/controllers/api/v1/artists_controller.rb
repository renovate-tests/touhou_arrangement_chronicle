module Api
  module V1
    class ArtistsController < ApplicationController
      def index
        if request.query_parameters.present?
          parameters = ArtistsParameter.new(request.query_parameters).define_params
          @artists = Artist.where(parameters)
        else
          @artists = Artist.all
        end
        render json: @artists&.sort_by(&:name_ja)
      end
    end
  end
end
