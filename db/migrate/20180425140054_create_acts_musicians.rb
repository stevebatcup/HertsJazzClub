class CreateActsMusicians < ActiveRecord::Migration[5.0]
  def change
    create_table :acts_musicians do |t|
      t.integer :act_id
      t.integer :musician_id
      t.integer :instrument_id
    end
  end
end
