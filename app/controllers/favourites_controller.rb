class FavouritesController < ApplicationController

	def index
		@memes = current_user.favourite_memes
	end

	def create
		@favourite = Favourite.new
		@favourite.meme_id = params[:meme_id]
		@favourite.user_id = current_user.id

		if @favourite.save
			respond_to do |format|
				format.js
			end
		end
	end

	def destroy
		@favourite = Favourite.find(params[:id])

		if @favourite.destroy
			respond_to do |format|
				format.js
			end
		end
	end
end
