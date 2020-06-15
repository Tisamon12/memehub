class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :resource, null: false, polymorphic: true
      t.boolean :is_upvote

      t.timestamps
    end
  end
end
