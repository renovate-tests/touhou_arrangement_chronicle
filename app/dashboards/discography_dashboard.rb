require "administrate/base_dashboard"

class DiscographyDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    songs: Field::HasMany,
    circle: Field::BelongsTo,
    event: Field::BelongsTo,
    id: Field::String.with_options(searchable: false),
    title_ja: Field::String,
    title_en: Field::String,
    release_date: Field::DateTime,
    part_number: Field::Number,
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
    :event,
    :release_date,
    :songs,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :circle,
    :title_ja,
    :title_en,
    :release_date,
    :part_number,
    :event,
    :songs,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title_ja,
    :title_en,
    :circle,
    :release_date,
    :part_number,
    :event,
  ].freeze

  # Overwrite this method to customize how discographies are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(discography)
    discography.title_ja
  end
end
