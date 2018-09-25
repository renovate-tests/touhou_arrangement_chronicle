class CircleSerializer < ApplicationSerializer
  attributes :name_ja, :category, :detail_category
  attributes :url

  def url
    "/circles/#{object.name_ja&.tr("/", "／")}"
  end
end
