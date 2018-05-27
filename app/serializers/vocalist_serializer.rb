class VocalistSerializer < ApplicationSerializer
  attributes :name_ja, :songs_count
  attributes :url

  def url
    "/vocalists/#{object.name_ja&.tr("/", "／")}"
  end
end
