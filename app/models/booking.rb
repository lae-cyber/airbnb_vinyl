class Booking < ApplicationRecord
  validates :firstname, :lastname, :card_name, :card_expiry, :card_cvc, :card_number, :address, presence: true
  valida
  belongs_to :user
  belongs_to :vinyl
end
