class ChangeActsGigsEtc < ActiveRecord::Migration[5.0]
  def change
  	drop_table	:acts
  	drop_table	:acts_gigs
  	drop_table	:acts_musicians

    create_table :performances do |t|
    	t.integer	:gig_id
    	t.integer	:musician_id
    	t.integer	:instrument_id
    end

  end
end
