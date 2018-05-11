class CreateGigs < ActiveRecord::Migration[5.0]
  def change
    create_table :gigs do |t|
      t.integer :venue_id
      t.integer :season_id
      t.integer :act_id
      t.text :description

      t.timestamps
    end
  end
end
