class AddVideoUrlToGigs < ActiveRecord::Migration[5.0]
  def change
    add_column :gigs, :video_url, :string
  end
end
