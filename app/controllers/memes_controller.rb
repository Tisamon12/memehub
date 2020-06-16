class MemesController < ApplicationController

	def index
		@memes = Meme.paginate(page: params[:page], per_page: 10).order("created_at DESC")
	end

	def top_memes
		@memes = Meme.paginate(page: params[:page], per_page: 10).order("rate DESC")
		render "index"
	end

	def random_meme
		@meme = Meme.limit(1).order("RAND()").first
		render "show"
	end

	def new
		@meme = Meme.new
	end

	def show
		@meme = Meme.find(params[:id])
	end

	def create
		@meme = Meme.new(meme_params)
		@meme.user = current_user

		if @meme.save
			redirect_to root_path
		else
			render "new"
		end
	end

	private

		def meme_params
			params.require(:meme).permit(:title, :meme_img)
		end

end
