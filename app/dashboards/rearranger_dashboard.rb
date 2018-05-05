require "administrate/base_dashboard"

class RearrangerDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    song_rearrangers: Field::HasMany,
    songs: Field::HasMany,
    artist: Field::BelongsTo,
    id: Field::String.with_options(searchable: false),
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
    :song_rearrangers,
    :songs,
    :artist,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :song_rearrangers,
    :songs,
    :artist,
    :id,
    :created_at,
    :updated_at,
    :songs_count,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :song_rearrangers,
    :songs,
    :artist,
    :songs_count,
  ].freeze

  # Overwrite this method to customize how rearrangers are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(rearranger)
  #   "Rearranger ##{rearranger.id}"
  # end
end
