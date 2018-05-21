class ArrangerSerializer < ApplicationSerializer
  attributes :name_ja, :songs_count
  attributes :url

  def url
    "/arrangers/#{object.name_ja&.tr("/", "／")}"
  end
end
