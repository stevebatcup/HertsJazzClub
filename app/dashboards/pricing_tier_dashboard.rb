require "administrate/base_dashboard"

class PricingTierDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    name: Field::String,
    standard: Field::Number.with_options(
      decimals: 2
    ),
    standard_advanced: Field::Number.with_options(
      decimals: 2
    ),
    concessions: Field::Number.with_options(
      decimals: 2
    ),
    concessions_advanced: Field::Number.with_options(
      decimals: 2
    ),
    members: Field::Number.with_options(
      decimals: 2
    ),
    members_advanced: Field::Number.with_options(
      decimals: 2
    )
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :name,
    :standard,
    :standard_advanced,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :name,
    :standard,
    :standard_advanced,
    :concessions,
    :concessions_advanced,
    :members,
    :members_advanced,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :standard,
    :standard_advanced,
    :concessions,
    :concessions_advanced,
    :members,
    :members_advanced,
  ].freeze

  # Overwrite this method to customize how pricing tiers are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(pricing_tier)
    pricing_tier.name
  end
end
