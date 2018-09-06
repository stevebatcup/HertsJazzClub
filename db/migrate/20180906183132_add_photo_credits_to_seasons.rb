class AddPhotoCreditsToSeasons < ActiveRecord::Migration[5.0]
  def change
    add_column :seasons, :photo_credits, :string
  end
end
