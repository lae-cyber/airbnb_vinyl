class AddCardinfoToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :address, :text
    add_column :bookings, :card_name, :string
    add_column :bookings, :card_number, :integer
    add_column :bookings, :card_expiry, :date
    add_column :bookings, :card_cvc, :string
    add_column :bookings, :firstname, :string
    add_column :bookings, :lastname, :string
  end
end
