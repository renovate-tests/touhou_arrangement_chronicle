module Api
  module V1
    class ArtistsController < ApplicationController
      def index
        if request.query_parameters.present?
          parameters = ArtistsParameter.new(request.query_parameters).define_params
          @artists = Artist.where(parameters)
        else
          @artists = Artist.order(:name_ja)
        end
        render json: @artists
      end
    end
  end
end
