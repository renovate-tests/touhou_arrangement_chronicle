class LyricistSerializer < ApplicationSerializer
  attributes :name_ja, :songs_count
  attributes :url

  def url
    "/lyricists/#{object.name_ja&.tr("/", "／")}"
  end
end
