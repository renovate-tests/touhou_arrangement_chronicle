module ArtistModule
  extend ActiveSupport::Concern
  included do
    scope :artist, -> { eager_load(:artist) }
    delegate :name_ja, :name_en, :site_url, :blog_url, :note_ja, :note_en,
      :category, :detail_category, :circle, :user, to: :artist, allow_nil: true
  end

  module ClassMethods
    def find_or_create_by!(name_ja: nil)
      artist = Artist.find_or_create_by!(name_ja: name_ja)
      super(artist: artist)
    end

    def search_by(name_ja: nil)
      self.artist.where(artists: { name_ja: name_ja })
    end
  end
end
