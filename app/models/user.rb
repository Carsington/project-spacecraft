class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo

  after_create :attach_default_image

  has_many :spaceships, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews

  validates :nickname, uniqueness: { case_sensitive: false }

  private

  def attach_default_image
    self.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "darth_vader_avatar.png")), filename: 'darth_vader_avatar.png' , content_type: "image/png")
  end
end
