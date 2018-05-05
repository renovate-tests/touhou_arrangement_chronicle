require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    artists: Field::HasMany,
    authentications: Field::HasMany,
    id: Field::String.with_options(searchable: false),
    name: Field::String,
    email: Field::String,
    crypted_password: Field::String,
    salt: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    image_path: Field::String,
    nick_name: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :artists,
    :authentications,
    :id,
    :name,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :artists,
    :authentications,
    :id,
    :name,
    :email,
    :crypted_password,
    :salt,
    :created_at,
    :updated_at,
    :image_path,
    :nick_name,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :artists,
    :authentications,
    :name,
    :email,
    :crypted_password,
    :salt,
    :image_path,
    :nick_name,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
