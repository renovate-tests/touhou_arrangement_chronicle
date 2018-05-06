require "administrate/base_dashboard"

class OriginalDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::String.with_options(searchable: false),
    code: Field::String,
    title_ja: Field::String,
    title_en: Field::String,
    short_title_ja: Field::String,
    short_title_en: Field::String,
    original_type: Field::I18nEnum.with_options(class_name: 'Original'),
    original_songs: Field::HasMany,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :code,
    :title_ja,
    :original_type,
    :original_songs,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :code,
    :title_ja,
    :title_en,
    :short_title_ja,
    :short_title_en,
    :original_type,
    :original_songs,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
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
  def display_resource(original)
    original.title_ja
  end
end
