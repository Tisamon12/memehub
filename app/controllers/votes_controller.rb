class VotesController < ApplicationController

	def create
		@vote = Vote.where(resource_id: params[:resource_id], resource_type: params[:resource_type], user_id: current_user.id).first_or_initialize
		@vote.is_upvote = params[:is_upvote]

		if @vote.save
			respond_to do |format|
				format.js
			end
		end
	end

end
