class CreatePageContents < ActiveRecord::Migration[5.0]
  def change
    create_table :page_contents do |t|
      t.string :page
      t.text :heading
      t.text :intro
      t.string :image
      t.text :body

      t.timestamps
    end
  end
end
