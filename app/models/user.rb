class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :memes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :favourite_memes, through: :favourites, source: "meme"

  has_one_attached :avatar

  has_many :profile_votes, as: :resource, class_name: "Vote"
  has_many :votes

  validates :username, presence: true
end
