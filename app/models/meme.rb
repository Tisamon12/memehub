class Meme < ApplicationRecord
  belongs_to :user

  has_one_attached :meme_img
end
