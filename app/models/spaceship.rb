class Spaceship < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search,
    against: [ :user, :name, :address, :description ],
    using: {
      tsearch: { prefix: true }
    }

  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews

  validates :name, :address, :description, :unit_price, :size,
            :max_speed, :capacity, presence: true
  validates :name, uniqueness: true, length: { minimum: 5 }
  validates :description, length: { minimum: 20 }
end
