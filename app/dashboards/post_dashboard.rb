require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    name: Field::String,
    email: Field::String,
    phone: Field::String,
    street_address: Field::String,
    zip: Field::String,
    description: Field::Text,
    description_met: Field::Text,
    picture: Field::String,
    facilitated_by_church: Field::Boolean,
    anon_email: Field::Boolean,
    status: Field::String.with_options(searchable: false),
    category: Field::String.with_options(searchable: false),
    flagged: Field::Number,
    show_phone: Field::Boolean,
    email_key: Field::String,
    activation_digest: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :title,
    :name,
    :email,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :title,
    :name,
    :email,
    :phone,
    :street_address,
    :zip,
    :description,
    :description_met,
    :picture,
    :facilitated_by_church,
    :anon_email,
    :status,
    :category,
    :flagged,
    :show_phone,
    :email_key,
    :activation_digest,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :name,
    :email,
    :phone,
    :street_address,
    :zip,
    :description,
    :description_met,
    :picture,
    :facilitated_by_church,
    :anon_email,
    :status,
    :category,
    :flagged,
    :show_phone,
    :email_key,
    :activation_digest,
  ].freeze

  # Overwrite this method to customize how posts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(post)
  #   "Post ##{post.id}"
  # end
end
