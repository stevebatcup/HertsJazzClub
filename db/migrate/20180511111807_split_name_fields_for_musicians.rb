class SplitNameFieldsForMusicians < ActiveRecord::Migration[5.0]
  def change
  	remove_column	:musicians, :name, :string
  	add_column	:musicians, :first_name, :string
  	add_column	:musicians, :last_name, :string
  end
end
