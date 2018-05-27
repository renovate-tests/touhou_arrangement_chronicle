class ArtistSerializer < ApplicationSerializer
  attributes :name_ja
  attributes :url

  def url
    "/artists/#{object.name_ja&.tr("/", "／")}"
  end
end
