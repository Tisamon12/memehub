class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meme
  
  has_many :child_comments, class_name: "Comment", foreign_key: "parent_comment_id"

  belongs_to :parent_comment, class_name: "Comment", optional: true

  scope :prime, -> {where(parent_comment_id: nil)}
end
