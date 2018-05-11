class ChangeSomeFields < ActiveRecord::Migration[5.0]
  def change
  	remove_column	:gigs, :act_id, :integer
  	remove_column	:gigs, :venue_id, :integer

  	drop_table	:gigs_acts

  	create_table :acts_gigs do |t|
  		t.integer	:act_id
  		t.integer	:gig_id
  	end

  	add_column	:gigs, :date, :date
  end
end
