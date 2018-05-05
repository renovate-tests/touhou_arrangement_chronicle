require "administrate/base_dashboard"

class OriginalSongDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    song_original_songs: Field::HasMany,
    songs: Field::HasMany,
    original: Field::BelongsTo,
    id: Field::String.with_options(searchable: false),
    code: Field::String,
    title_ja: Field::String,
    title_en: Field::String,
    original_code: Field::String,
    composer: Field::String,
    track_number: Field::Number,
    is_duplicate: Field::Boolean,
    is_hidden: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    songs_count: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :song_original_songs,
    :songs,
    :original,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :song_original_songs,
    :songs,
    :original,
    :id,
    :code,
    :title_ja,
    :title_en,
    :original_code,
    :composer,
    :track_number,
    :is_duplicate,
    :is_hidden,
    :created_at,
    :updated_at,
    :songs_count,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :song_original_songs,
    :songs,
    :original,
    :code,
    :title_ja,
    :title_en,
    :original_code,
    :composer,
    :track_number,
    :is_duplicate,
    :is_hidden,
    :songs_count,
  ].freeze

  # Overwrite this method to customize how original songs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(original_song)
  #   "OriginalSong ##{original_song.id}"
  # end
end
