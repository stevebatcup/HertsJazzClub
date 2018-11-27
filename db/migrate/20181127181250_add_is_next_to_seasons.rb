class AddIsNextToSeasons < ActiveRecord::Migration[5.0]
  def change
    add_column :seasons, :is_next, :boolean, before: :is_current, default: false
  end
end
