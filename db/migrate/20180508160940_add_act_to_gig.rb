class AddActToGig < ActiveRecord::Migration[5.0]
  def change
    add_column :gigs, :act, :string
  end
end
