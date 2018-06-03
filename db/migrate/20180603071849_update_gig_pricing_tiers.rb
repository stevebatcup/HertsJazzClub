class UpdateGigPricingTiers < ActiveRecord::Migration[5.0]
  def change
  	remove_column	:gigs, :pricing_tier, :integer
  	add_column	:gigs, :pricing_tier_id, :integer, default: 1
  end
end
