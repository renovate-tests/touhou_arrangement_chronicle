module Api
  module V1
    class CirclesController < ApplicationController
      def index
        if request.query_parameters.present?
          parameters = CirclesParameter.new(request.query_parameters).define_params
          @circles = Circle.where(parameters)
        else
          @circles = Circle.all
        end
        render json: @circles&.sort_by(&:name_ja)
      end
    end
  end
end
