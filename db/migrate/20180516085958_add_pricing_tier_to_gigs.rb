class AddPricingTierToGigs < ActiveRecord::Migration[5.0]
  def change
    add_column :gigs, :pricing_tier, :integer, default: 1
  end
end
