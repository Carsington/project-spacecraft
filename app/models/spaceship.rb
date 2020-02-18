class Spaceship < ApplicationRecord
  # TODO : remove the 'optional: true' from 'belongs_to'
  belongs_to :user, dependent: :destroy, optional: true

  has_many :bookings
  has_many :reviews

  validates :name, :address, :description, :unit_price, :size,
            :max_speed, :capacity, presence: true
  validates :name, uniqueness: true, length: { minimum: 5 }
  validates :description, length: { minimum: 20 }
  # validates :main_pic_url, presence: true
end
