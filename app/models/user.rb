class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourite_memes, through: :favourites, source: "meme"

  has_one_attached :avatar

  validates :username, presence: true
end
