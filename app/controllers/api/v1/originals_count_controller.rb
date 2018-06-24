module Api
  module V1
    class OriginalsCountController < ApplicationController
      def index(object, object_id, original_code = nil)
        o = object.classify.constantize.find_by(id: object_id)
        if original_code.present?
          original = Original.find_by(code: original_code)
          count = o.original_songs_count(original)
        else
          count = o.originals_count
        end
        render json: count.to_a
      end
    end
  end
end

