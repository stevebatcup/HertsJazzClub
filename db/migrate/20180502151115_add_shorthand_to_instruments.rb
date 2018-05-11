class AddShorthandToInstruments < ActiveRecord::Migration[5.0]
  def change
    add_column :instruments, :shorthand, :string
  end
end
