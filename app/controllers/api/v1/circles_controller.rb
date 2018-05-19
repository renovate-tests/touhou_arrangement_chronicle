module Api
  module V1
    class CirclesController < ApplicationController
      def index
        if request.query_parameters.present?
          parameters = CirclesParameter.new(request.query_parameters).define_params
          @circles = Circle.where(parameters)
        else
          @circles = Circle.order(:name_ja)
        end
        render json: @circles
      end
    end
  end
end
