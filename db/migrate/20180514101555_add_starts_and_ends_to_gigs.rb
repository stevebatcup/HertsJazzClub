	class AddStartsAndEndsToGigs < ActiveRecord::Migration[5.0]
  def change
    add_column :gigs, :starts, :datetime
    add_column :gigs, :ends, :datetime
    add_column :gigs, :parent_id, :integer, default: nil
  end
end
