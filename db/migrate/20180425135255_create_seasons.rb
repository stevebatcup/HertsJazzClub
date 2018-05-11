class CreateSeasons < ActiveRecord::Migration[5.0]
  def change
    create_table :seasons do |t|
      t.string :year
      t.string :name
      t.integer :venue_id
      t.boolean :is_current, default: false

      t.timestamps
    end
  end
end
