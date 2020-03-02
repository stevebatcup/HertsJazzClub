class AddStudentsPricePointsToPricingTiers < ActiveRecord::Migration[5.0]
  def change
    add_column :pricing_tiers, :students, :decimal, :precision => 8, :scale => 2
    add_column :pricing_tiers, :students_advanced, :decimal, :precision => 8, :scale => 2
  end
end
