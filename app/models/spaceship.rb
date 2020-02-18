class Spaceship < ApplicationRecord
  # TODO : remove the 'optional: true' from 'belongs_to'
  belongs_to :user, dependent: :destroy, optional: true
  has_many :bookings
  has_many :reviews
end
