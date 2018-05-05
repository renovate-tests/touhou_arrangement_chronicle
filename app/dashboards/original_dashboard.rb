require "administrate/base_dashboard"

class OriginalDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    original_songs: Field::HasMany,
    id: Field::String.with_options(searchable: false),
    code: Field::String,
    title_ja: Field::String,
    title_en: Field::String,
    short_title_ja: Field::String,
    short_title_en: Field::String,
    original_type: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :original_songs,
    :id,
    :code,
    :title_ja,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :original_songs,
    :id,
    :code,
    :title_ja,
    :title_en,
    :short_title_ja,
    :short_title_en,
    :original_type,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :original_songs,
    :code,
    :title_ja,
    :title_en,
    :short_title_ja,
    :short_title_en,
    :original_type,
  ].freeze

  # Overwrite this method to customize how originals are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(original)
  #   "Original ##{original.id}"
  # end
end
