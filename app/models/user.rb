class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :spaceships, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews
  
  has_one_attached :photo

  validates :nickname, uniqueness: { case_sensitive: false }
end
