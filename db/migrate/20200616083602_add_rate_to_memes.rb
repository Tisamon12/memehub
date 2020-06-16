class AddRateToMemes < ActiveRecord::Migration[6.0]
  def change
  	add_column :memes, :rate, :integer, default: 0
  end
end
