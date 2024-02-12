class AddVinylToBooking < ActiveRecord::Migration[7.1]
  def change
    add_reference :bookings, :vinyl, null: false, foreign_key: true
  end
end
