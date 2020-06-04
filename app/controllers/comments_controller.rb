class CommentsController < ApplicationController

	def create
		comment = Comment.new(comment_params)
		comment.user_id = current_user.id
		comment.save
		redirect_to meme_path(id: comment.meme.id)
	end

	private

		def comment_params
			params.require(:comment).permit(:content, :meme_id, :parent_comment_id)
		end

end
