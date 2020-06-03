class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.string :title
      t.datetime :upload_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
