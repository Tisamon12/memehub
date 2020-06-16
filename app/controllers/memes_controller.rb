class MemesController < ApplicationController

	def index
		@memes = Meme.paginate(page: params[:page], per_page: 10).order("created_at DESC")
	end

	def top_memes
		@memes = Meme.paginate(page: params[:page], per_page: 10).order("rate DESC")
		render "index"
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
