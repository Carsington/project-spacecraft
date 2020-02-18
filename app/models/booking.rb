class Booking < ApplicationRecord
  belongs_to :spaceship
  belongs_to :user

  validates :spaceship, :user, :start_date, :end_date, :total_price, presence: true
end
