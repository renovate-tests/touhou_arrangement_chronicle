require "administrate/base_dashboard"

class SongDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    song_arrangers: Field::HasMany,
    arrangers: Field::HasMany,
    song_composers: Field::HasMany,
    composers: Field::HasMany,
    song_lyricists: Field::HasMany,
    lyricists: Field::HasMany,
    song_original_songs: Field::HasMany,
    original_songs: Field::HasMany,
    song_rearrangers: Field::HasMany,
    rearrangers: Field::HasMany,
    song_vocalists: Field::HasMany,
    vocalists: Field::HasMany,
    circle: Field::BelongsTo,
    discography: Field::BelongsTo,
    event: Field::BelongsTo,
    id: Field::String.with_options(searchable: false),
    title_ja: Field::String,
    title_en: Field::String,
    track_number: Field::Number,
    length: Field::Number,
    bpm: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :song_arrangers,
    :arrangers,
    :song_composers,
    :composers,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :song_arrangers,
    :arrangers,
    :song_composers,
    :composers,
    :song_lyricists,
    :lyricists,
    :song_original_songs,
    :original_songs,
    :song_rearrangers,
    :rearrangers,
    :song_vocalists,
    :vocalists,
    :circle,
    :discography,
    :event,
    :id,
    :title_ja,
    :title_en,
    :track_number,
    :length,
    :bpm,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :song_arrangers,
    :arrangers,
    :song_composers,
    :composers,
    :song_lyricists,
    :lyricists,
    :song_original_songs,
    :original_songs,
    :song_rearrangers,
    :rearrangers,
    :song_vocalists,
    :vocalists,
    :circle,
    :discography,
    :event,
    :title_ja,
    :title_en,
    :track_number,
    :length,
    :bpm,
  ].freeze

  # Overwrite this method to customize how songs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(song)
  #   "Song ##{song.id}"
  # end
end
