class Spaceship < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, :address, :description, :unit_price, :size,
            :max_speed, :capacity, presence: true
  validates :name, uniqueness: true, length: { minimum: 5 }
  validates :description, length: { minimum: 20 }
  # validates :main_pic_url, presence: true
end
