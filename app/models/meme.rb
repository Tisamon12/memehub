class Meme < ApplicationRecord
  belongs_to :user

  has_one_attached :meme_img

  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
end
