class CreateInstrumentsMusicians < ActiveRecord::Migration[5.0]
  def change
    create_table :instruments_musicians do |t|
      t.integer :instrument_id
      t.integer :musician_id
    end
  end
end
