class CreateGigsActs < ActiveRecord::Migration[5.0]
  def change
    create_table :gigs_acts do |t|
      t.integer :gig_id
      t.integer :act_id
    end
  end
end
