require "administrate/base_dashboard"

class GigDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    act: Field::String,
    season: Field::BelongsTo,
    starts: Field::DateTime,
    ends: Field::DateTime,
    performances: PerformanceField,
    description: Field::Text,
    image: ImageField,
    website: Field::StringWithHintField.with_options(
      hint: "seperate multiple websites with a comma<br />e.g. www.website1.com, www.website2.com"
    ),
    pricing_tier: Field::BelongsTo,
    booking_url: Field::String,
    gallery_url: Field::String,
    children: SelectField.with_options(
      choices: Gig.all
    ),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :starts,
    :act,
    :performances,
    :season,
    :pricing_tier,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :starts,
    :ends,
    :act,
    :performances,
    :season,
    :image,
    :description,
    :website,
    :pricing_tier,
    :booking_url,
    :gallery_url,
    :created_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :starts,
    :ends,
    :act,
    :performances,
    :season,
    :description,
    :image,
    :website,
    :pricing_tier,
    :booking_url,
    :gallery_url,
    :children,
  ].freeze

  # Overwrite this method to customize how gigs are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(gig)
  #   "Gig ##{gig.id}"
  # end
end
