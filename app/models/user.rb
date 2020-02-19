class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  has_many :spaceships, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews

  validates :nickname, uniqueness: { case_sensitive: false }
end
