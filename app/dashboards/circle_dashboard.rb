require "administrate/base_dashboard"

class CircleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    artists: Field::HasMany,
    discographies: Field::HasMany,
    songs: Field::HasMany,
    id: Field::String.with_options(searchable: false),
    name_ja: Field::String,
    name_en: Field::String,
    circle_type: Field::String,
    site_url: Field::String,
    blog_url: Field::String,
    category: Field::String,
    detail_category: Field::String,
    note_ja: Field::Text,
    note_en: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :artists,
    :discographies,
    :songs,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :artists,
    :discographies,
    :songs,
    :id,
    :name_ja,
    :name_en,
    :circle_type,
    :site_url,
    :blog_url,
    :category,
    :detail_category,
    :note_ja,
    :note_en,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :artists,
    :discographies,
    :songs,
    :name_ja,
    :name_en,
    :circle_type,
    :site_url,
    :blog_url,
    :category,
    :detail_category,
    :note_ja,
    :note_en,
  ].freeze

  # Overwrite this method to customize how circles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(circle)
  #   "Circle ##{circle.id}"
  # end
end
