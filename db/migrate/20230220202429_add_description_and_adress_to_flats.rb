class AddDescriptionAndAdressToFlats < ActiveRecord::Migration[7.0]
  def change
    add_column :flats, :description, :text
    add_column :flats, :address, :string
  end
end
