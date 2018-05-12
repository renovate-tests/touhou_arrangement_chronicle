require "administrate/base_dashboard"

class SongDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::String.with_options(searchable: false),
    title_ja: Field::String,
    title_en: Field::String,
    track_number: Field::Number,
    circle: Field::BelongsTo,
    discography: Field::BelongsTo,
    event: Field::BelongsTo,
    original_songs: Field::HasMany,
    vocalists: Field::HasMany,
    composers: Field::HasMany,
    arrangers: Field::HasMany,
    rearrangers: Field::HasMany,
    lyricists: Field::HasMany,
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
    :title_ja,
    :circle,
    :discography,
    :event,
    :track_number,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title_ja,
    :title_en,
    :track_number,
    :circle,
    :discography,
    :event,
    :original_songs,
    :vocalists,
    :composers,
    :arrangers,
    :rearrangers,
    :lyricists,
    :length,
    :bpm,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title_ja,
    :title_en,
    :track_number,
    :circle,
    :discography,
    :event,
    :original_songs,
    :vocalists,
    :composers,
    :arrangers,
    :rearrangers,
    :lyricists,
    :length,
    :bpm,
  ].freeze

  # Overwrite this method to customize how songs are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(song)
    song.title_ja
  end
end
