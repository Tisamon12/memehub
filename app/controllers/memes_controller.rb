class MemesController < ApplicationController

	def index
		@memes = Meme.all
	end

	def new
		@meme = Meme.new
	end

	def show
		@meme = Meme.find(params[:id])
	end

	def create
		Meme.create(meme_params.merge({user_id: current_user.id}))
		redirect_to root_path
	end

	private

		def meme_params
			params.require(:meme).permit(:title, :meme_img)
		end

end
