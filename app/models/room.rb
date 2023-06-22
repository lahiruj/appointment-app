class Room < ApplicationRecord
  has_many :bookings
  validates :name, :capacity, presence: :true
end
