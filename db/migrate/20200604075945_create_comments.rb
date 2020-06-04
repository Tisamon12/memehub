class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.bigint :user_id, null: false, foreign_key: true
      t.bigint :meme_id, null: false, foreign_key: true
      t.bigint :parent_comment_id, foreign_key: true, default: nil

      t.timestamps
    end
  end
end
