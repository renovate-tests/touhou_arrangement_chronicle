module Api
  module V1
    class VocalistsController < ApplicationController
      def index
        if request.query_parameters.present?
          parameters = VocalistsParameter.new(request.query_parameters).define_params
          @vocalists = Vocalist.artist.where(artists: parameters)
        else
          @vocalists = Vocalist.artist
        end
        render json: @vocalists
      end
    end
  end
end
