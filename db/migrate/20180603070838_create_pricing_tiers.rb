class CreatePricingTiers < ActiveRecord::Migration[5.0]
  def change
    create_table :pricing_tiers do |t|
      t.string :name
      t.decimal :standard, :precision => 8, :scale => 2
      t.decimal :standard_advanced, :precision => 8, :scale => 2
      t.decimal :concessions, :precision => 8, :scale => 2
      t.decimal :concessions_advanced, :precision => 8, :scale => 2
      t.decimal :members, :precision => 8, :scale => 2
      t.decimal :members_advanced, :precision => 8, :scale => 2
    end
  end
end
