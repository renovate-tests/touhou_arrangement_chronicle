module ArtistModule
  extend ActiveSupport::Concern
  included do
    scope :artist, -> { eager_load(:artist) }
    scope :alphabet, -> { artist.where(artists: { category: 'alphabet' }) }
    scope :alphabet_by, ->(alphabet) { artist.where(artists: { category: 'alphabet', detail_category: alphabet }) }
    scope :hiragana, -> { artist.where(artists: { category: 'hiragana' }) }
    scope :hiragana_by, ->(hiragana) { artist.where(artists: { category: 'hiragana', detail_category: hiragana }) }
    scope :kanji, -> { artist.where(artists: { category: 'kanji' }) }
    scope :katakana, -> { artist.where(artists: { category: 'katakana' }) }
    scope :katakana_by, ->(katakana) { artist.where(artists: { category: 'katakana', detail_category: katakana }) }
    scope :number, -> { artist.where(artists: { category: 'number' }) }
    scope :search_by, ->(name_ja) { artist.where(artists: { name_ja: name_ja }) }
    scope :symbol, -> { artist.where(artists: { category: 'symbol' }) }
    delegate :name_ja, :name_en, :site_url, :blog_url, :note_ja, :note_en,
      :category, :detail_category, :circle, :user, to: :artist, allow_nil: true
  end

  module ClassMethods
    def find_or_create_by!(name_ja: nil)
      artist = Artist.find_or_create_by!(name_ja: name_ja)
      super(artist: artist)
    end
  end

  def name
    name_ja
  end
end
