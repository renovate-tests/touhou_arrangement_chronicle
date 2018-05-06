require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    discographies: Field::HasMany,
    songs: Field::HasMany,
    event_series: Field::BelongsTo,
    id: Field::String.with_options(searchable: false),
    title_ja: Field::String,
    title_en: Field::String,
    display_title_ja: Field::String,
    display_title_en: Field::String,
    times: Field::Number,
    days: Field::Number,
    date: Field::DateTime,
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
    :title_ja,
    :event_series,
    :times,
    :date,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :event_series,
    :title_ja,
    :title_en,
    :display_title_ja,
    :display_title_en,
    :times,
    :days,
    :date,
    :note_ja,
    :note_en,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title_ja,
    :title_en,
    :display_title_ja,
    :display_title_en,
    :event_series,
    :times,
    :days,
    :date,
    :note_ja,
    :note_en,
  ].freeze

  # Overwrite this method to customize how events are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(event)
    event.title_ja
  end
end
