class Review < ApplicationRecord
  belongs_to :spaceship
  belongs_to :user

  validates :comment, :stars, presence: true
  validates :stars, inclusion: { in: 1..5 }
end
