class AddUrlsToGigs < ActiveRecord::Migration[5.0]
  def change
    add_column :gigs, :booking_url, :string
    add_column :gigs, :gallery_url, :string
  end
end
