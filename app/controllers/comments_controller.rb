class CommentsController < ApplicationController

	def create
		comment = Comment.new(comment_params)
		comment.user_id = current_user.id
		comment.save
		redirect_to meme_path(id: comment.meme.id)
	end

	def destroy
		@comment = Comment.find(params[:id])

		if @comment.user_id == current_user.id
			if @comment.destroy
				flash[:notice] = "Pomyślnie usunięto komentarz"
			else
				flash[:alert] = "Nie udało się usunąć komentarza"
			end
		else
			flash[:alert] = "Nie masz uprawnień aby usunąć ten komentarz"
		end

		redirect_to meme_path(@comment.meme)
	end

	private

		def comment_params
			params.require(:comment).permit(:content, :meme_id, :parent_comment_id)
		end

end
