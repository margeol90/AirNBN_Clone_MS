class AddGuestsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :adults, :integer
    add_column :bookings, :children, :integer
  end
end
