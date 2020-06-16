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

  validates :username, :email, :password, :password_confirmation, presence: true

  after_create :attach_default_avatar


  private

    def attach_default_avatar
      avatar.attach(io: File.open('app/assets/images/default_avatar.png'), filename: 'default_avatar.png')
    end
end
